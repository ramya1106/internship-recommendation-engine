import './App.css'

import {BrowserRouter, Routes, Route } from "react-router-dom";

import Internships from './Components/Internships'
import InternshipItemDetails from './Components/InternshipItemDetails'
import NotFound from './Components/NotFound'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Internships />} />
        <Route path="/jobs/:id" element={<InternshipItemDetails />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}


export default App