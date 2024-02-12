package com.library.pages;

import com.library.utility.ConfigurationReader;
import com.library.utility.Driver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

//log IN PAGE IS NOT PART OF THE BASE PAGE
public class LoginPage {

    public LoginPage() {
        PageFactory.initElements(Driver.getDriver(), this);
    }

    @FindBy(id = "inputEmail")
    public WebElement emailBox;

    @FindBy(id = "inputPassword")
    public WebElement passwordBox;

    @FindBy(tagName = "button")
    public WebElement loginButton;



    public void login(String userType){

        //student or librarian
        String username= ConfigurationReader.getProperty(userType+"_username");
        String password=ConfigurationReader.getProperty(userType+"_password");

        emailBox.sendKeys(username);
        passwordBox.sendKeys(password);
        loginButton.click();

    }




}