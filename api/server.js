const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "Football Live API is running"
  });
});

app.get("/api/news", (req, res) => {
  res.json({
    success: true,
    news: [
      {
        id: 1,
        title: "آخرین اخبار فوتبال",
        description: "اخبار فوتبال به‌زودی در این بخش نمایش داده می‌شود.",
        category: "فوتبال"
      }
    ]
  });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Football Live API running on port ${PORT}`);
});
