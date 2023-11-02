import React from "react";
import MyBG from "../assets/hero.jpg"
import { HeroSection } from "./HeroElemets";

const Hero = () => {
  return (
    <>  
      <HeroSection className="light hero">
            <img src={MyBG}></img>
        <div className="heroInner">
            <h1>Selamat Datang Di Welcome !</h1>
            <p>Di Website Praktikum Pemrograman Web !</p>
        </div>
      </HeroSection>
    </>
  );
};

export default Hero;
