package com.hi.hospital.entity;

public class Announcement {
    int announcementId;
    String title;
    String image;
    String content;
    String creationTime;

    @Override
    public String toString() {
        return "Announcement{" +
                "announcementId=" + announcementId +
                ", title='" + title + '\'' +
                ", image='" + image + '\'' +
                ", content='" + content + '\'' +
                ", creationTime='" + creationTime + '\'' +
                ", creator='" + creator + '\'' +
                '}';
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    String creator;

    public int getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(int announcementId) {
        this.announcementId = announcementId;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
