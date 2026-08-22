const express = require("express");
const cors = require("cors");

const app = express();

const PORT = process.env.PORT || 3000;
const FOOTBALL_DATA_TOKEN = process.env.FOOTBALL_DATA_TOKEN;

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "football_live API is running ⚽"
  });
});

async function footballDataRequest(endpoint) {
  if (!FOOTBALL_DATA_TOKEN) {
    throw new Error("FOOTBALL_DATA_TOKEN is not configured");
  }

  const response = await fetch(
    `https://api.football-data.org/v4${endpoint}`,
    {
      headers: {
        "X-Auth-Token": FOOTBALL_DATA_TOKEN,
        "Accept": "application/json"
      }
    }
  );

  if (!response.ok) {
    const text = await response.text();
    throw new Error(`Football API Error ${response.status}: ${text}`);
  }

  return await response.json();
}

app.get("/api/matches", async (req, res) => {
  try {
    const data = await footballDataRequest("/matches");

    res.json({
      success: true,
      count: data.matches?.length || 0,
      matches: data.matches || []
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "دریافت مسابقات با مشکل مواجه شد",
      error: error.message
    });
  }
});

app.get("/api/live", async (req, res) => {
  try {
    const data = await footballDataRequest("/matches");

    const liveMatches = (data.matches || []).filter(
      match =>
        match.status === "IN_PLAY" ||
        match.status === "PAUSED"
    );

    res.json({
      success: true,
      count: liveMatches.length,
      matches: liveMatches
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "دریافت بازی‌های زنده با مشکل مواجه شد",
      error: error.message
    });
  }
});

app.get("/api/matches/:id", async (req, res) => {
  try {
    const data = await footballDataRequest(
      `/matches/${req.params.id}`
    );

    res.json({
      success: true,
      match: data
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "دریافت جزئیات بازی با مشکل مواجه شد",
      error: error.message
    });
  }
});

app.get("/api/news", (req, res) => {
  res.json({
    success: true,
    news: [
      {
        id: 1,
        title: "football_live فعال شد",
        description: "نتایج فوتبال به‌صورت آنلاین در دسترس است.",
        category: "اخبار"
      }
    ]
  });
});

app.get("/api/health", (req, res) => {
  res.json({
    success: true,
    server: "online",
    footballDataToken: FOOTBALL_DATA_TOKEN
      ? "configured"
      : "missing"
  });
});

app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "مسیر مورد نظر پیدا نشد"
  });
});

app.listen(PORT, () => {
  console.log(`football_live API running on port ${PORT}`);
});
