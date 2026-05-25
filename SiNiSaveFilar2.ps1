<#
    SiNiSaveFilar2 - SiNiSistar2 Save Tool
    Copyright (C) 2026 Akiloneus

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#>

$scriptDir = $PSScriptRoot
if (-not $scriptDir) { $scriptDir = $PWD.Path }

$global:LangData = @{
    "en"    = @{
        "Title"            = "SiNiSaveFilar2 - SiNiSistar2 Save Tool"
        "MenuDecode"       = "1. Decode Saves (Read and decode from script directory)"
        "MenuEncode"       = "2. Encode Saves (Repack modified JSON into save files)"
        "MenuExit"         = "0. Exit"
        "SelectOp"         = "Please select an operation:`n"
        "MoveCursor"       = "[Up/Down]: Move cursor    [Enter]: Confirm`n"
        "MoveCursorMulti"  = "[Up/Down]: Move       [Space]: Check/Uncheck"
        "MultiBottom"      = "[A]: Select All       [Enter]: Confirm"
        "CancelEsc"        = "[Esc/Q]: Cancel`n"
        "MoveCursorSingle" = "[Up/Down]: Move       [Enter]: Confirm"
        "NoSavesFound"     = "No obfuscated save files found in {0}!"
        "PressAnyKey"      = "Press any key to return to menu..."
        "SelectDecode"     = "Please select the save files to [Decode]:"
        "DecodeSuccess"    = "Successfully decoded: {0} -> {1}"
        "ExtractedThumb"   = "  - Extracted thumbnail: {0}"
        "DecodeComplete"   = "`nDecoding complete! Files saved to: {0}"
        "NoDecodedDirs"    = "No _SaveData_decoded folders found. Please decode saves first!"
        "SelectFolder"     = "Please select the [Folder] containing your modified JSON files:"
        "NoJsonFiles"      = "No .json files found in the selected folder!"
        "SelectEncode"     = "Please select the files to [Encode] and repack:"
        "EncodeSuccess"    = "Successfully encoded: {0} -> {1}{2}"
        "IncludesThumb"    = " (Includes thumbnail)"
        "EncodeComplete"   = "`nRepacking complete! Encoded saves stored in: {0}"
        "CopyBack"         = "You can now copy these files back to your game's save directory to overwrite the original saves."
    }
    "zh-CN" = @{
        "Title"            = "SiNiSaveFilar2 - SiNiSistar2 存档加解密工具"
        "MenuDecode"       = "1. 解密存档 (从脚本所在目录读取并解密)"
        "MenuEncode"       = "2. 加密存档 (将修改后的 JSON 重新打包)"
        "MenuExit"         = "0. 退出"
        "SelectOp"         = "请选择一个操作：`n"
        "MoveCursor"       = "[上下键]: 移动光标    [回车]: 确认`n"
        "MoveCursorMulti"  = "[上下键]: 移动        [空格]: 选中/取消"
        "MultiBottom"      = "[A]: 全选             [回车]: 确认"
        "CancelEsc"        = "[Esc/Q]: 取消返回`n"
        "MoveCursorSingle" = "[上下键]: 移动        [回车]: 确认"
        "NoSavesFound"     = "在 {0} 中未找到混淆的存档文件！"
        "PressAnyKey"      = "按任意键返回菜单..."
        "SelectDecode"     = "请选择需要【解密 (Decode)】的存档文件："
        "DecodeSuccess"    = "成功解密: {0} -> {1}"
        "ExtractedThumb"   = "  - 提取缩略图: {0}"
        "DecodeComplete"   = "`n解密完成！文件已保存至: {0}"
        "NoDecodedDirs"    = "未找到任何 _SaveData_decoded 文件夹。请先解密存档！"
        "SelectFolder"     = "请选择包含您修改后 JSON 的【文件夹】："
        "NoJsonFiles"      = "选中的文件夹中没有找到 .json 文件！"
        "SelectEncode"     = "请选择需要【加密 (Encode)】并重新打包的文件："
        "EncodeSuccess"    = "成功加密: {0} -> {1}{2}"
        "IncludesThumb"    = " (包含缩略图)"
        "EncodeComplete"   = "`n打包完成！加密存档已保存至: {0}"
        "CopyBack"         = "您现在可以直接将这些文件复制回游戏的存档目录来覆盖原存档。"
    }
    "zh-TW" = @{
        "Title"            = "SiNiSaveFilar2 - SiNiSistar2 存檔加解密工具"
        "MenuDecode"       = "1. 解密存檔 (從腳本所在目錄讀取並解密)"
        "MenuEncode"       = "2. 加密存檔 (將修改後的 JSON 重新打包)"
        "MenuExit"         = "0. 退出"
        "SelectOp"         = "請選擇一個操作：`n"
        "MoveCursor"       = "[上下鍵]: 移動游標    [Enter]: 確認`n"
        "MoveCursorMulti"  = "[上下鍵]: 移動        [空白鍵]: 選取/取消"
        "MultiBottom"      = "[A]: 全選             [Enter]: 確認"
        "CancelEsc"        = "[Esc/Q]: 取消返回`n"
        "MoveCursorSingle" = "[上下鍵]: 移動        [Enter]: 確認"
        "NoSavesFound"     = "在 {0} 中未找到混淆的存檔文件！"
        "PressAnyKey"      = "按任意鍵返回選單..."
        "SelectDecode"     = "請選擇需要【解密 (Decode)】的存檔文件："
        "DecodeSuccess"    = "成功解密: {0} -> {1}"
        "ExtractedThumb"   = "  - 提取縮略圖: {0}"
        "DecodeComplete"   = "`n解密完成！文件已保存至: {0}"
        "NoDecodedDirs"    = "未找到任何 _SaveData_decoded 資料夾。請先解密存檔！"
        "SelectFolder"     = "請選擇包含您修改後 JSON 的【資料夾】："
        "NoJsonFiles"      = "選中的資料夾中沒有找到 .json 文件！"
        "SelectEncode"     = "請選擇需要【加密 (Encode)】並重新打包的文件："
        "EncodeSuccess"    = "成功加密: {0} -> {1}{2}"
        "IncludesThumb"    = " (包含縮略圖)"
        "EncodeComplete"   = "`n打包完成！加密存檔已保存至: {0}"
        "CopyBack"         = "您現在可以直接將這些文件複製回遊戲的存檔目錄來覆蓋原存檔。"
    }
    "ja"    = @{
        "Title"            = "SiNiSaveFilar2 - SiNiSistar2 セーブデータツール"
        "MenuDecode"       = "1. 復号化 (スクリプトディレクトリから読み込み)"
        "MenuEncode"       = "2. 暗号化 (変更したJSONを再パック)"
        "MenuExit"         = "0. 終了"
        "SelectOp"         = "操作を選択してください:`n"
        "MoveCursor"       = "[上下キー]: 移動      [Enter]: 決定`n"
        "MoveCursorMulti"  = "[上下キー]: 移動      [Space]: 選択/解除"
        "MultiBottom"      = "[A]: 全て選択         [Enter]: 決定"
        "CancelEsc"        = "[Esc/Q]: キャンセル`n"
        "MoveCursorSingle" = "[上下キー]: 移動      [Enter]: 決定"
        "NoSavesFound"     = "{0} に難読化されたセーブデータが見つかりません！"
        "PressAnyKey"      = "何かキーを押してメニューに戻る..."
        "SelectDecode"     = "【復号化 (Decode)】するセーブデータを選択してください:"
        "DecodeSuccess"    = "復号化成功: {0} -> {1}"
        "ExtractedThumb"   = "  - サムネイル抽出: {0}"
        "DecodeComplete"   = "`n復号化完了！保存先: {0}"
        "NoDecodedDirs"    = "_SaveData_decoded フォルダが見つかりません。先に復号化を行ってください！"
        "SelectFolder"     = "変更したJSONが含まれる【フォルダ】を選択してください:"
        "NoJsonFiles"      = "選択したフォルダに .json ファイルが見つかりません！"
        "SelectEncode"     = "【暗号化 (Encode)】して再パックするファイルを選択してください:"
        "EncodeSuccess"    = "暗号化成功: {0} -> {1}{2}"
        "IncludesThumb"    = " (サムネイルを含む)"
        "EncodeComplete"   = "`n再パック完了！保存先: {0}"
        "CopyBack"         = "これらのファイルをゲームのセーブデータディレクトリにコピーして、元のセーブデータを上書きできます。"
    }
}

$global:CurrentLang = "en"
function Get-Str([string]$Key, [array]$FormatArgs = @()) {
    $text = $global:LangData[$global:CurrentLang][$Key]
    if (-not $text) { $text = $Key }
    if ($FormatArgs.Count -gt 0) {
        return $text -f $FormatArgs
    }
    return $text
}

function Select-Language {
    $cursor = 0
    $needsRedraw = $true
    $options = @(
        @{ Label = "English"; Code = "en" },
        @{ Label = "简体中文"; Code = "zh-CN" },
        @{ Label = "繁體中文"; Code = "zh-TW" },
        @{ Label = "日本語"; Code = "ja" }
    )
    
    while ($true) {
        if ($needsRedraw) {
            Clear-Host
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host "Choose your language / 请选择您的语言" -ForegroundColor White
            Write-Host "請選擇您的語言 / 言語を選択してください:" -ForegroundColor White
            Write-Host "==========================================`n" -ForegroundColor Cyan
            
            for ($i = 0; $i -lt $options.Count; $i++) {
                $prefix = if ($i -eq $cursor) { ">>" } else { "  " }
                $color = if ($i -eq $cursor) { "Yellow" } else { "White" }
                Write-Host "  $prefix $($options[$i].Label)" -ForegroundColor $color
            }
            $needsRedraw = $false
        }
        
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 38) {
            # Up
            if ($cursor -gt 0) { $cursor-- }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 40) {
            # Down
            if ($cursor -lt ($options.Count - 1)) { $cursor++ }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 13) {
            # Enter
            $global:CurrentLang = $options[$cursor].Code
            return
        }
    }
}

function Show-MainMenu {
    $cursor = 0
    $needsRedraw = $true
    
    while ($true) {
        if ($needsRedraw) {
            Clear-Host
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host (Get-Str "Title") -ForegroundColor White
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host (Get-Str "SelectOp") -ForegroundColor Cyan
            Write-Host (Get-Str "MoveCursor") -ForegroundColor DarkGray
            
            $options = @( (Get-Str "MenuDecode"), (Get-Str "MenuEncode"), (Get-Str "MenuExit") )
            for ($i = 0; $i -lt $options.Count; $i++) {
                $prefix = if ($i -eq $cursor) { ">>" } else { "  " }
                $color = if ($i -eq $cursor) { "Yellow" } else { "White" }
                Write-Host "  $prefix $($options[$i])" -ForegroundColor $color
            }
            $needsRedraw = $false
        }
        
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 38) {
            if ($cursor -gt 0) { $cursor-- }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 40) {
            if ($cursor -lt 2) { $cursor++ }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 13) {
            return $cursor
        }
    }
}

function Get-MultiSelection($items, $prompt) {
    $selected = @($false) * $items.Count
    $cursor = 0
    $needsRedraw = $true
    
    while ($true) {
        if ($needsRedraw) {
            Clear-Host
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host (Get-Str "Title") -ForegroundColor White
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host "$prompt`n" -ForegroundColor Cyan
            Write-Host (Get-Str "MoveCursorMulti") -ForegroundColor DarkGray
            Write-Host (Get-Str "MultiBottom") -ForegroundColor DarkGray
            Write-Host (Get-Str "CancelEsc") -ForegroundColor DarkGray
            
            for ($i = 0; $i -lt $items.Count; $i++) {
                $prefix = if ($i -eq $cursor) { ">>" } else { "  " }
                $checkbox = if ($selected[$i]) { "[x]" } else { "[ ]" }
                $color = if ($i -eq $cursor) { "Yellow" } else { "White" }
                Write-Host "  $prefix $checkbox $($items[$i].Name)" -ForegroundColor $color
            }
            $needsRedraw = $false
        }
        
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 38) {
            if ($cursor -gt 0) { $cursor-- }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 40) {
            if ($cursor -lt ($items.Count - 1)) { $cursor++ }
            $needsRedraw = $true
        }
        elseif ($key.Character -eq ' ') {
            $selected[$cursor] = -not $selected[$cursor]
            $needsRedraw = $true
        }
        elseif ($key.Character -eq 'a' -or $key.Character -eq 'A') {
            $allSelected = ($selected -notcontains $false)
            for ($i = 0; $i -lt $selected.Count; $i++) { $selected[$i] = -not $allSelected }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 13) {
            break
        }
        elseif ($key.VirtualKeyCode -eq 27 -or $key.Character -eq 'q' -or $key.Character -eq 'Q') {
            return @()
        }
    }
    
    $result = @()
    for ($i = 0; $i -lt $items.Count; $i++) {
        if ($selected[$i]) { $result += $items[$i] }
    }
    Clear-Host
    return $result
}

function Get-SingleSelection($items, $prompt) {
    $cursor = 0
    $needsRedraw = $true
    
    while ($true) {
        if ($needsRedraw) {
            Clear-Host
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host (Get-Str "Title") -ForegroundColor White
            Write-Host "==========================================" -ForegroundColor Cyan
            Write-Host "$prompt`n" -ForegroundColor Cyan
            Write-Host (Get-Str "MoveCursorSingle") -ForegroundColor DarkGray
            Write-Host (Get-Str "CancelEsc") -ForegroundColor DarkGray
            
            for ($i = 0; $i -lt $items.Count; $i++) {
                $prefix = if ($i -eq $cursor) { ">>" } else { "  " }
                $color = if ($i -eq $cursor) { "Yellow" } else { "White" }
                Write-Host "  $prefix $($items[$i].Name)" -ForegroundColor $color
            }
            $needsRedraw = $false
        }
        
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 38) {
            if ($cursor -gt 0) { $cursor-- }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 40) {
            if ($cursor -lt ($items.Count - 1)) { $cursor++ }
            $needsRedraw = $true
        }
        elseif ($key.VirtualKeyCode -eq 13) {
            Clear-Host
            return $items[$cursor]
        }
        elseif ($key.VirtualKeyCode -eq 27 -or $key.Character -eq 'q' -or $key.Character -eq 'Q') {
            Clear-Host
            return $null
        }
    }
}

function Invoke-DecodeSaves {
    $searchPath = $scriptDir
    
    $files = Get-ChildItem -Path $searchPath -File | Where-Object { $_.Name -match '^(File\d+|System.*)$' -and $_.Extension -eq '' }
    if ($files.Count -eq 0) {
        Clear-Host
        Write-Host (Get-Str "NoSavesFound" @($searchPath)) -ForegroundColor Red
        Write-Host (Get-Str "PressAnyKey")
        $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        return
    }
    
    $selectedFiles = Get-MultiSelection $files (Get-Str "SelectDecode")
    
    if ($selectedFiles.Count -eq 0) { return }
    
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    
    $backupDir = Join-Path $scriptDir "${timestamp}_SaveData_backup"
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    
    $outDir = Join-Path $scriptDir "${timestamp}_SaveData_decoded"
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    
    foreach ($file in $selectedFiles) {
        Copy-Item -Path $file.FullName -Destination (Join-Path $backupDir $file.Name) -Force
        $lines = @(Get-Content $file.FullName)
        if ($lines.Count -gt 0) {
            $bytes = [System.Convert]::FromBase64String($lines[0])
            [Array]::Reverse($bytes)
            $json = [System.Text.Encoding]::UTF8.GetString($bytes)
            
            $outJson = Join-Path $outDir "$($file.Name).json"
            [System.IO.File]::WriteAllText($outJson, $json, [System.Text.Encoding]::UTF8)
            Write-Host (Get-Str "DecodeSuccess" @($file.Name, "$($file.Name).json")) -ForegroundColor Green
            
            if ($lines.Count -gt 1) {
                try {
                    $pngBytes = [System.Convert]::FromBase64String($lines[1])
                    $outPng = Join-Path $outDir "$($file.Name)_thumbnail.png"
                    [System.IO.File]::WriteAllBytes($outPng, $pngBytes)
                    Write-Host (Get-Str "ExtractedThumb" @("$($file.Name)_thumbnail.png")) -ForegroundColor DarkGreen
                }
                catch { }
            }
        }
    }
    Write-Host (Get-Str "DecodeComplete" @($outDir)) -ForegroundColor Cyan
    Write-Host (Get-Str "PressAnyKey")
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Invoke-EncodeSaves {
    $decodedDirs = Get-ChildItem -Path $scriptDir -Directory | Where-Object { $_.Name -match '_SaveData_decoded' }
    if ($decodedDirs.Count -eq 0) {
        Clear-Host
        Write-Host (Get-Str "NoDecodedDirs") -ForegroundColor Yellow
        Write-Host (Get-Str "PressAnyKey")
        $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        return
    }
    
    $sourceDir = Get-SingleSelection $decodedDirs (Get-Str "SelectFolder")
    if (-not $sourceDir) { return }
    
    $jsonFiles = Get-ChildItem -Path $sourceDir.FullName -Filter "*.json"
    if ($jsonFiles.Count -eq 0) {
        Write-Host (Get-Str "NoJsonFiles") -ForegroundColor Yellow
        Write-Host (Get-Str "PressAnyKey")
        $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        return
    }
    
    $selectedFiles = Get-MultiSelection $jsonFiles (Get-Str "SelectEncode")
    
    if ($selectedFiles.Count -eq 0) { return }
    
    $timestamp = $sourceDir.Name -replace '_SaveData_decoded$', ''
    if (-not $timestamp -or $timestamp -eq $sourceDir.Name) { 
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss" 
    }
    $outDir = Join-Path $scriptDir "${timestamp}_SaveData_encoded"
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    
    foreach ($file in $selectedFiles) {
        $baseName = $file.BaseName
        $json = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($json)
        [Array]::Reverse($bytes)
        $line1 = [System.Convert]::ToBase64String($bytes)
        
        $outFile = Join-Path $outDir $baseName
        [System.IO.File]::WriteAllText($outFile, $line1, [System.Text.Encoding]::ASCII)
        
        $pngPath = Join-Path $sourceDir.FullName "${baseName}_thumbnail.png"
        if (Test-Path $pngPath) {
            $pngBytes = [System.IO.File]::ReadAllBytes($pngPath)
            $line2 = [System.Convert]::ToBase64String($pngBytes)
            [System.IO.File]::AppendAllText($outFile, "`n" + $line2, [System.Text.Encoding]::ASCII)
            $thumbMsg = (Get-Str "IncludesThumb")
        }
        else {
            $thumbMsg = ""
        }
        
        Write-Host (Get-Str "EncodeSuccess" @($file.Name, $baseName, $thumbMsg)) -ForegroundColor Green
    }
    
    Write-Host (Get-Str "EncodeComplete" @($outDir)) -ForegroundColor Cyan
    Write-Host (Get-Str "CopyBack") -ForegroundColor Yellow
    Write-Host (Get-Str "PressAnyKey")
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

$host.ui.RawUI.WindowTitle = "SiNiSaveFilar2"

Select-Language

while ($true) {
    $choice = Show-MainMenu
    switch ($choice) {
        0 { Invoke-DecodeSaves }
        1 { Invoke-EncodeSaves }
        2 { Clear-Host; return }
    }
}
