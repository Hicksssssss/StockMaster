module com.stockmaster{
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.web;
    requires javafx.graphics;
    requires javafx.media;
    requires java.base;


    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires validatorfx;
    requires org.kordamp.ikonli.javafx;
    requires org.kordamp.bootstrapfx.core;
    requires eu.hansolo.tilesfx;
    requires java.sql;
    requires jasperreports;
    requires org.burningwave.core;

    opens com.stockmaster to javafx.fxml;
    exports com.stockmaster;
    exports com.stockmaster.entity;
    opens com.stockmaster.entity to javafx.fxml;
    exports com.stockmaster.config;
    opens com.stockmaster.config to javafx.fxml;
    exports com.stockmaster.app;
    opens com.stockmaster.app to javafx.fxml;
}