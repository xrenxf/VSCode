// App.js
import React from "react";
import { Route, BrowserRouter as Router, Routes } from "react-router-dom";
import "./App.css";
import Navbar from "./components/Navbar/navbar";
import Home from "./pages/home";
import About from "./pages/about";
import Footer from "./components/Footer/footer";
import Contact from "./pages/contacts";

function App() {
  return (
  <div>
    <div className="myBG">
      <Router>
        <Navbar />
        <Routes>
         <Route path="/home" element={<Home />} />
         <Route path="/about" element={<About />} />
          <Route path="/contact" element={<Contact />} />
       </Routes>
       <Footer />
      </Router>
    </div>
  </div>
  );
}

export default App;
