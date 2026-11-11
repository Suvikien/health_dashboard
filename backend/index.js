import express from "express";
import cors from "cors";

import pool from "./db.js";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors({ origin: "http://localhost:5173" }));
app.use(express.json());

app.get("/api/health", (req, res) => {
    res.json({ status: "ok" });
});

app.get("/api/stats", async (req, res) => { // if someone visits /api/stats/ run this
    try{
        const [rows] = await pool.query("SELECT COUNT(*) AS total FROM patients"); // loop through and count the amount of lines
        const [encounterRows] = await pool.query("SELECT COUNT(*) AS total FROM encounters"); // loop through and count the amount of lines
        res.json({ patients: rows[0].total, encounterRows: encounterRows[0].total });
    } catch (err){
        res.status(500).json({error: "Failed to load stats"});
    }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));