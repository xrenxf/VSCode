import React from "react";
import Logo from "../assets/logo-ilab.png"
import Twitter from "../assets/Twitter.png"
import Facebook from "../assets/Facebook.png"
import Instagram from "../assets/Instagram.png"
import {
  Box,
  FooterContainer,
  Row,
  Column,
  FooterLink,
  Heading,
} from "./FooterElemets";

const Footer = () => {
  return (
    <Box>
      <FooterContainer>
        <Row>
          <Column className="col align-self-center">
            <p><img src={Logo} alt="logo" width="100px" height="40px"></img></p>
            <p>Copyright &copy; 2023 Infinite Learning</p>
          </Column>
          <Column>
            <Heading>Services</Heading>
            <FooterLink href="#">Email Marketing</FooterLink>
            <FooterLink href="#">Campaigns</FooterLink>
            <FooterLink href="#">Branding</FooterLink>
            <FooterLink href="#">Offline</FooterLink>
          </Column>
          <Column>
            <Heading>About</Heading>
            <FooterLink href="#">Our Story</FooterLink>
            <FooterLink href="#">Benefits</FooterLink>
            <FooterLink href="#">Team</FooterLink>
            <FooterLink href="#">Careers</FooterLink>
          </Column>
          <Column>
            <Heading>Follow Us</Heading>
            <FooterLink href="#">
              <i className="fab fa-facebook-f">
                <span
                  style={{
                    marginLeft: "10px",
                  }}
                >
                  <img src={Facebook} height={23} width={20} ></img>
                  Facebook
                </span>
              </i>
            </FooterLink>
            <FooterLink href="#">
              <i className="fab fa-instagram">
                <span
                  style={{
                    marginLeft: "10px",
                  }}
                >
                  <img src={Twitter} height={23}></img>
                  Twitter
                </span>
              </i>
            </FooterLink>
            <FooterLink href="#">
              <i className="fab fa-twitter">
                <span
                  style={{
                    marginLeft: "10px",
                  }}
                >
                  <img src={Instagram} height={23}></img>
                  Instagram
                </span>
              </i>
            </FooterLink>
          </Column>
        </Row>
      </FooterContainer>
    </Box>
  );
};
export default Footer;
