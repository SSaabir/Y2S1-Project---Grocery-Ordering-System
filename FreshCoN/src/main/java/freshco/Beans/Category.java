package freshco.Beans;

public class Category {

    private int CID;
    private String category_Name;
    private String imgUrl;

    public Category(int cID, String category_Name, String imgUrl) {
        super();
        CID = cID;
        this.category_Name = category_Name;
        this.imgUrl = imgUrl;
    }

    public int getCID() {
        return CID;
    }

    public String getCategory_Name() {
        return category_Name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setCID(int cID) {
        CID = cID;
    }

    public void setCategory_Name(String category_Name) {
        this.category_Name = category_Name;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
