import React from "react";
// import Hero from "../components/hero"
import Background from "../components/assets/hero.jpg"

const About = () => {
  return (
    <div>
      <img src={Background}></img>
      <div>
        <div style={{
              fontSize: 13,
              color: "white",
              position: "absolute",
              top: "50%",
              left: "5%",
        }}>
          <h1>Website ini merupakan platform untuk kegiatan praktikum</h1>
          <h1>pemrograman web bagi mahasiswa informatika</h1>
          <h1>selama perkuliahan!</h1>
        </div>
      </div>
    </div>
  );
};

export default About;
