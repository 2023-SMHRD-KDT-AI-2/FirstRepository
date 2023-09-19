
/**
 * 
 */

  let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(35.11039142255239, 126.87748644508468), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            
        let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 지도 줌 컨트롤 
        
        
        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        let mapTypeControl = new kakao.maps.MapTypeControl();
        
        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        let zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 클릭

        // 지도를 클릭한 위치에 표출할 마커입니다
        let marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);

        
        
        // 지도에 클릭 이벤트를 등록합니S다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다 
            let latlng = mouseEvent.latLng;
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);
            
            let message = '';
            
            let resultDiv = document.getElementById('clickLatlng');
            resultDiv.innerHTML = message;
            // 클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, 
            // message += '경도는 ' + latlng.getLng() + ' 입니다';
        });


        //////////////////////////////////////////////////////////////////////////////////////////////////////////////       
      // 게시글 작성 후 마커

		

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////       
        // 주소-좌표
        let geocoder = new kakao.maps.services.Geocoder();

        function searchAddrFromCoords(coords, callback) {
            // 좌표로 행정동 주소 정보를 요청합니다
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
        }

        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            
        }

        // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                    detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                    
                    var content = '<div class="bAddr">' +
                                    '<span class="title"></span>' + 
                                    detailAddr + 
                                '</div>';

                    // 마커를 클릭한 위치에 표시합니다 
                    marker.setPosition(mouseEvent.latLng);
                    marker.setMap(map);

                    // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                    infowindow.setContent(content);
                    infowindow.open(map, marker);
                    let meetingPlace = document.getElementById('meetingPlace')
                    meetingPlace.value = result[0].address.address_name
                      // 위도 경도값을 구합니다.
                    $("#latitude").val(mouseEvent.latLng.getLng())
                    $("#longitude").val(mouseEvent.latLng.getLat())
                }   
            });
        });

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////       
        // 카테고리       
        
        
        let placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
        markers = [], // 마커를 담을 배열입니다
        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
        // 장소 검색 객체를 생성합니다
        let ps = new kakao.maps.services.Places(map);
        // let category = document.getElementById('category');
        // 지도에 idle 이벤트를 등록합니다
        
        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
        contentNode.className = 'placeinfo_wrap';

        // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
        // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
        addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
        addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
        
        // 커스텀 오버레이 컨텐츠를 설정합니다
        placeOverlay.setContent(contentNode);

        // 각 카테고리에 클릭 이벤트를 등록합니다
        addCategoryClickEvent();
        
        // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
        function addEventHandle(target, type, callback) {
            if (target.addEventListener) {
                target.addEventListener(type, callback);
            } else {
                target.attachEvent('on' + type, callback);
            }
        }
        
        // 카테고리 검색을 요청하는 함수입니다
        function searchPlaces() {
            if (!currCategory) {
                return;
            }
            
            // 커스텀 오버레이를 숨깁니다 
            placeOverlay.setMap(null);
            
            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            ps.categorySearch(currCategory, placesSearchCB1, { useMapBounds: true });
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                
                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                displayPlaces(data);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
                
            } else if (status === kakao.maps.services.Status.ERROR) {
                // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
            }
        }

        // 지도에 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
            // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
            let order = document.getElementById(currCategory).getAttribute('data-order');
            
            
            
            for (let i = 0; i < places.length; i++) {
                
                // 마커를 생성하고 지도에 표시합니다
                let marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
                // 마커와 검색결과 항목을 클릭 했을 때
                // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                (function (marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function () {
                        displayPlaceInfo(place);
                    });
                })(marker, places[i]);
            }
        }
        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, order) {
            let imageSrcArray = [
                '⛩',
                '🍴',
                '☕'
                
            ];
            let imageSrc = imageSrcArray[order % imageSrcArray.length];
            imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                    image: markerImage
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다
            
            return marker;
        }

        
        

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for (let i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
            markers = [];
        }

        // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
        function displayPlaceInfo(place) {
            let content = '<div class="placeinfo">' +
                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';
                
            if (place.road_address_name) {
                content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
            } else {
                content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
            }
            
            content += '    <span class="tel">' + place.phone + '</span>' +
            '</div>' +
            '<div class="after"></div>';

            contentNode.innerHTML = content;
            placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
            placeOverlay.setMap(map);
        }

        
        // 각 카테고리에 클릭 이벤트를 등록합니다
        function addCategoryClickEvent() {
            let category = document.getElementById('category'),
            children = category.children;
            
            for (let i = 0; i < children.length; i++) {
                children[i].onclick = onClickCategory;
            }
        }

        // 카테고리를 클릭했을 때 호출되는 함수입니다
        function onClickCategory() {
            let id = this.id,
            className = this.className;
            
            placeOverlay.setMap(null);
            
            if (className === 'on') {
                currCategory = '';
                changeCategoryClass();
                removeMarker();
            } else {
                currCategory = id;
                changeCategoryClass(this);
                searchPlaces();
            }
        }

        // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
        function changeCategoryClass(el) {
            let category = document.getElementById('category'),
                children = category.children,
                i;
                
                for (i = 0; i < children.length; i++) {
                    children[i].className = '';
                }
                
                if (el) {
                    el.className = 'on';
            }
        }

        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 검색  
        
        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        let infowindow = new kakao.maps.InfoWindow({ zIndex: 2 });
        
        // 키워드로 장소를 검색합니다
        customSearchPlaces();
        
        // 키워드 검색을 요청하는 함수입니다
        function customSearchPlaces() {

            let keyword = document.getElementById('keyword').value;
            
            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                return false;
            }
            
            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch(keyword, placesSearchCB);
        }
        
    ////////////////////////////////////
    /*선웅 추가*/
    /*CCTV 마커*/
    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function cctvAddMarker(position, idx, title) {
        let imageSrc = 'images/cctv5.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(20, 20),  // 마커 이미지의 크기
        imgOptions = {
				/*spriteSize: new kakao.maps.Size(36, 691)*/
                /*spriteSize: new kakao.maps.Size(100, 250), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표*/
                offset: new kakao.maps.Point(36, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }        
    ////////////////////////////////////
    /*선웅 추가*/    
    function displayPlaces3(places) {
    let order = document.getElementById(currCategory).getAttribute('data-order');
    let filteredPlaces = [];

    // 최대 50개의 장소만 필터링
    for (let i = 0; i < places.length && filteredPlaces.length < 50; i++) {
        // 장소의 좌표
        let placeLatLng = new kakao.maps.LatLng(places[i].y, places[i].x);

        // Create a marker and display it on the map
        let marker = cctvAddMarker(placeLatLng, order);

        // Register a click event to display location information
        /*(function (marker, place) {
            kakao.maps.event.addListener(marker, 'click', function () {
                displayPlaceInfo(place);
            });
        })*/(marker, places[i]);

        filteredPlaces.push(places[i]);
    }
}
        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        ////////////////////////////// 선웅 수정
        function placesSearchCB1(data, status, pagination) {	
			if(currCategory=="AD5"){
/*				    $.ajax({
						url : "CctvProgram",
						type : "get",
						dataType : "json",
						success : function(data){
							displayPlaces1(data);
							console.log("cctv");  
							
						 },
						error : function(){ alert("error");  }
					});*/
						let center = map.getCenter();
					    $.ajax({
							url : "LocationProgram",
							type : "get",
							data : { "lat" : center.getLat(), "lng" : center.getLng() },
							dataType : "json",
							success : function(data){
								console.log("cctv2")
								console.log(data);
								displayPlaces3(data); 
							 },
							error : function(){ alert("error"); }		
						 });
			}else if (status === kakao.maps.services.Status.OK) {
			    	console.log("dddd");	                
	                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	                displayPlaces(data);
	            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	                // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요                
	                
	            } else if (status === kakao.maps.services.Status.ERROR) {
	                // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        } 
	                     
        };


        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            let listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';
            
            // 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);
            
            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            for (let i = 0; i < places.length; i++) {
                
                // 마커를 생성하고 지도에 표시합니다
                let placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
                
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);
                
                // 마커와 검색결과 항목에 mouseover 했을때
                // 해당 장소에 인포윈도우에 장소명을 표시합니다
                // mouseout 했을 때는 인포윈도우를 닫습니다
                (function (marker, title) {
                    kakao.maps.event.addListener(marker, 'mouseover', function () {
                        displayInfowindow(marker, title);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function () {
                        infowindow.close();
                    });
                    
                    itemEl.onmouseover = function () {
                        displayInfowindow(marker, title);
                    };
                    
                    itemEl.onmouseout = function () {
                        infowindow.close();
                    };
                })(marker, places[i].place_name);
                
                fragment.appendChild(itemEl);
            }

            // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
            // listEl.appendChild(fragment);
            menuEl.scrollTop = 0;
            
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }

        // 검색결과 항목을 Element로 반환하는 함수입니다
        function getListItem(index, places) {

            let el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
            '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
                
                if (places.road_address_name) {
                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' + places.address_name + '</span>';
                } else {
                    itemStr += '    <span>' + places.address_name + '</span>';
                }
                
                itemStr += '  <span class="tel">' + places.phone + '</span>' +
                '</div>';
                
                el.innerHTML = itemStr;
                el.className = 'item';
                
                return el;
            }

        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            let imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                    spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage
                });

                marker.setMap(map); // 지도 위에 마커를 표출합니다
                markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                return marker;
            }
            
            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for (let i = 0; i < markers.length; i++) {
                    markers[i].setMap(null);
                }
                markers = [];
        }
        
        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            let paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;
            
            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild(paginationEl.lastChild);
            }
            
            for (i = 1; i <= pagination.last; i++) {
                let el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;
                
                if (i === pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function (i) {
                        return function () {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }

                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            let content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
            
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }

        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
            while (el.hasChildNodes()) {
                el.removeChild(el.lastChild);
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////
        // 게시물작성
        
        let post = document.getElementById('post')
        let map2 = document.getElementById('map')
        let message2 = document.getElementById('message')
        let me = document.getElementById('me')
        let modal = document.getElementById('myModal');
        let modalBackground = document.getElementById('modalBackground');
        let postContent = document.getElementById('postContent');
        let savePost = document.getElementById('savePost');
        let isPostClicked = false;

        post.addEventListener('click', function() {
            if (!isPostClicked) {
                // post 클릭 시에만 이 코드 블록 실행
                map2.style.opacity = '0.5';
                message2.style.position = 'relative';
                message2.style.zIndex = '2';
                message2.innerHTML = '모임 장소를 선택해주세요.';
                me.style.backgroundColor='white'
                me.style.width= '200px';
                me.style.left= '75px';
                me.style.position= 'relative';
                message2.style.textAlign = 'center';
            } else {
                // 이미 post를 클릭한 경우 이 코드 블록 실행22
                map2.style.opacity = '1';
                message2.style.position = 'static';
                message2.innerHTML = '';
            }
                isPostClicked = !isPostClicked;
        });

        map2.addEventListener('click', function(mouseEvent) {
            if (isPostClicked) {
                modal.style.display = 'block';
                console.log('확인',modalBackground);
                modalBackground.style.display = 'block';
                modal.style.position= "relative";
                modal.style.zIndex = "2";
                modalBackground.style.position= "relative";
                modalBackground.style.zIndex = "2";
            }
        });
   
/*        savePost.addEventListener('click', function() {
            //게시글 저장
            let content = postContent.value;
            alert('게시글이 저장되었습니다:\n');

            // 모달 창 닫음
            modal.style.display = 'none';
            modalBackground.style.display = 'none';

            map2.style.opacity = '1';
            message2.style.position = 'static';
            message2.innerHTML = '';
         
         
         
            // 입력 필드 초기화
            postTitle.value = '';
            numParticipants.selectedIndex = 0; // 첫 번째 옵션으로 초기화
            postContent.value = '';
            isPostClicked = false;
            map2.style.opacity = '1';
            message2.style.position = 'static';
            message2.innerHTML = '';
        });*/
           // 게시물 저장 시 내용 안 채웠을 때 / 선웅
           function check(){
            if($(postTitle).val()!= ''&& $(meetingTime).val()!= ''&& $(postContent).val()!= ''){
            // 모달 창 닫음
             alert('게시글이 저장되었습니다:\n');
            modal.style.display = 'none';
            modalBackground.style.display = 'none';

            map2.style.opacity = '1';
            message2.style.position = 'static';
            message2.innerHTML = '';
            }else{
               alert('모든 값을 입력해주세요!')
               return false;
            }
         }
                
        ////////////////////////////////////////////////////////////////////////////////////
        // 게시글 작성 시 인원 수 
        let numParticipantsSelect = document.getElementById('numParticipants');

        for (let i = 1; i <= 100; i++) { // 원하는 범위로 변경
            const option = document.createElement('option');
            option.value = i;
            option.text = i + '명';
            numParticipantsSelect.appendChild(option);
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        // 게시글 작성 취소
        let cancelPost = document.getElementById('cancelPost')
        cancelPost.addEventListener('click',function(){
            modal.style.display = 'none';
            modalBackground.style.display = 'none';

            map2.style.opacity = '1';
            message2.style.position = 'static';
            message2.innerHTML = '';

            // 입력 필드 초기화
            postTitle.value = '';
            numParticipants.selectedIndex = 0; // 첫 번째 옵션으로 초기화
            postContent.value = '';
            isPostClicked = false;
            map2.style.opacity = '1';
            message2.style.position = 'static';
            message2.innerHTML = '';
        });
        
        let btn4 = document.getElementById("A4");
        btn4.addEventListener("click",function(){
			window.location = "goProfile"
		})

           