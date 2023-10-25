import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom"; // Mengganti 'Switch' dengan 'Routes'
import Navbar from "./components/Navbar";
import Hero from "./components/Hero";
import Footer from "./components/Footer";
import Menu from "./pages/Menu";
import About from "./pages/About";
import Contact from "./pages/Contact";

function App() {
  return (
    <Router>
      <div>
        <Navbar />
        <Hero />
        <Routes> {/* Menggunakan 'Routes' sebagai pengganti 'Switch' */}
          <Route path="/" element={<Menu />} />
          <Route path="/about" element={<About />} />
          <Route path="/contact" element={<Contact />} />
        </Routes>
        <Footer />
      </div>
    </Router>
  );
}

export default App;
