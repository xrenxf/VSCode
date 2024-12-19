import React from "react";
import Logo from "../assets/logo-ilab.png"
import {
  Nav,
  NavLink,
  Bars,
  NavMenu,
  Button
} from "./NavbarElemets";

const Navbar = () => {
  return (
    <>
      <Nav>
        <img src={Logo} alt="logo" width="100px" height="40px"></img>
        <Bars/>
        <NavMenu>
          <NavLink to="/home" activeStyle>
            Home
          </NavLink>
         <NavLink to="/about" activeStyle>
           About
          </NavLink>
           <NavLink to="/contact" activeStyle>
             Contact
         </NavLink>
        </NavMenu>
        <Button style={{
          backgroundColor:"white",
          width:200,
          height:35,
          fontSize:15,
          }}>Sign Up</Button>
        <Button style={{
          backgroundColor:"#2879f2",
          width:200,
          height:35,
          fontSize:15,
          }}>LogIn</Button>
      </Nav>
    </>
  );
};

export default Navbar;
