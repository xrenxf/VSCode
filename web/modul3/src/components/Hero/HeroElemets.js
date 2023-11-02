import styled from "styled-components";
import { NavLink as Link } from "react-router-dom";

export const HeroSection = styled(Link)`
  height: 100vh;
  justify-content: center;
  align-items: center;
  text-align: center;
  color: #fafafc;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); /* Add a subtle box shadow */

  .heroInner {
    font-weight: 200;
    color: white;
    position: absolute;
    top: 50%;
    left: 5%;
  }


  `;
