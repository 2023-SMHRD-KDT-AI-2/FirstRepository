package playwithme.controller;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class CustomFileRenamePolicy implements FileRenamePolicy {
    @Override
    public File rename(File file) {
        // 파일 이름 중복 처리를 하지 않고 원래 파일 이름 그대로 사용
        return file;
    }
}