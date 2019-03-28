package model;

import org.springframework.web.multipart.MultipartFile;

public class Image {
	private MultipartFile usPhoto;

	public MultipartFile getUsPhoto() {
		return usPhoto;
	}
	public void setUsPhoto(MultipartFile usPhoto) {
		this.usPhoto = usPhoto;
	}
}
