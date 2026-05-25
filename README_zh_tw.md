[English](README.md) | [日本語](README_jp.md) | [简体中文](README_zh_cn.md) | [繁體中文](README_zh_tw.md)
---

# SiNiSaveFilar2 - SiNiSistar2 Save Tool

<img src="assets/images/preview_01.png" width="49%" /> <img src="assets/images/preview_02.png" width="49%" />

一款專為遊戲 **SiNiSistar2** 設計的多語言存檔解密與重新打包工具。*（註：本專案目前純粹基於 Windows PowerShell 腳本實現）*。

[![Download Latest Release](https://img.shields.io/badge/下載-最新版本(Release)-2ea44f?style=for-the-badge&logo=github)](https://github.com/akiloneus/SiNiSaveFilar2/releases/latest)

## 功能特點
- **互動式 TUI 選單**：簡單易用的終端機使用者介面，全面支援多語言（英語、簡體中文、繁體中文、日語）。
- **解密混淆存檔**：安全讀取遊戲被混淆的存檔文件（如 `File01`, `System` 等），並將它們解密為高度可讀、可編輯的 `.json` 格式，同時完整保留縮略圖資料。
- **自動備份**：在執行任何解密操作之前，自動為您創建原始存檔的備份，防止意外的資料遺失。
- **智能打包 (Encode)**：將您修改後的 JSON 資料無縫重新打包回遊戲原生的混淆編碼格式，確保遊戲引擎可以完美讀取。

## 使用方法
1. **[推薦]** 前往 [Releases](https://github.com/akiloneus/SiNiSaveFilar2/releases/latest) 頁面下載最新的 `.zip` 壓縮包並解壓，將其中的 `SiNiSaveFilar2.ps1` 和 `Run_SiNiSaveFilar2.bat` 放置在與您的 SiNiSistar2 存檔文件相同的目錄中。
   - *(如果您是直接下載的本倉庫源碼，請進入 `scripts/powershell/` 目錄獲取這兩個文件)*。
   - *DLsite 版存檔路徑：* `%USERPROFILE%\AppData\LocalLow\Uu\SiNiSistar2\SaveData`
   - *Steam 版存檔路徑：* `%USERPROFILE%\AppData\LocalLow\Uu\SiNiSistar2\SaveData_S`
2. 雙擊 **`Run_SiNiSaveFilar2.bat`** 啟動工具。
   - *(註：使用 `.bat` 文件會自動繞過 PowerShell 的執行策略限制，只需雙擊即可安全運行)*。
3. 按照螢幕上的 TUI 提示選擇您的語言及需要執行的操作：
   - **[1] 解密存檔 (Decode Saves)**：將存檔提取到一個新創建的 `<timestamp>_SaveData_decoded` 資料夾中，並將原文件備份到 `<timestamp>_SaveData_backup`。
   - **編輯 (Edit)**：使用任意文字編輯器（如記事本、VSCode）打開提取出的 `.json` 文件，修改遊戲內變數（如 `m_PlayerName`、物品或屬性等）。
   - **[2] 加密存檔 (Encode Saves)**：在工具中選擇您修改過的資料夾，將編輯過的 JSON 重新打包到 `<timestamp>_SaveData_encoded` 資料夾中。
4. 將 `encoded` 資料夾中新打包好的文件複製回根目錄的 `SaveData`（或 `SaveData_S`）資料夾中，覆蓋原始文件。
5. 啟動遊戲。

## 免責聲明

**請自行承擔使用風險。** 修改遊戲存檔資料可能會導致不可預測的遊戲行為、崩潰或不可逆的存檔損壞。
- 雖然本工具會嘗試自動創建備份，但強烈建議您在使用前手動備份整個存檔資料夾。
- 對於因使用或濫用本腳本而導致的任何進度遺失、資料損壞或其他損失，本工具作者概**不負責**。

**無關聯聲明：** SiNiSaveFilar2 是一個非官方的社群自製工具。它與 **Uu**（SiNiSistar2 的官方開發團隊）及其合作夥伴**沒有任何關聯、背書或官方聯繫**。所有產品名稱、標誌和品牌均為其各自所有者的財產。

## 開源協議
本專案採用 GNU General Public License v3.0 協議進行開源 - 詳情請參閱 LICENSE 文件。
