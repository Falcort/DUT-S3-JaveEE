package Modele;

public class OiseauModele {

    int idBird;
    String photoBird;
    String raceBird;
    int priceBird;

    public int getIdBird() {
        return idBird;
    }

    public String getPhotoBird() {
        return photoBird;
    }

    public String getRaceBird() {
        return raceBird;
    }
    
    public int getPriceBird() {
        return priceBird;
    }

    public void setIdBird(int idBird) {
        this.idBird = idBird;
    }

    public void setPhotoBird(String photoBird) {
        this.photoBird = photoBird;
    }

    public void setRaceBird(String raceBird) {
        this.raceBird = raceBird;
    }

    public void setPriceBird(int priceBird) {
        this.priceBird = priceBird;
    }
}