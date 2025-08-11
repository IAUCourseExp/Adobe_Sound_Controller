🎧 اسکریپت کنترل صدای Adobe Connect با میان‌بر کیبورد
=====================================================

این اسکریپت ساده و کاربردی به شما امکان می‌دهد صدای برنامه یا نسخه وب Adobe Connect را به صورت مستقل از صدای اصلی سیستم، با میان‌برهای کیبورد قطع و وصل کنید و تمرکز بیشتری در کارهای خودتون داشته باشید. 😁🤫

✅ ویژگی‌ها
----------

*   **کنترل صدای مجزا:** فقط صدای Adobe Connect را مدیریت می‌کند و کاری به صدای سایر برنامه‌ها ندارد.
    
*   **میان‌برهای سفارشی:** با فشردن Ctrl + Y صدای برنامه قطع و با فشردن Ctrl + N وصل می‌شود.
    
*   **پشتیبانی از اپلیکیشن و وب:** روی هر دو نسخه دسکتاپ و تحت وب Adobe Connect کار می‌کند.
    

🔧 نصب و راه‌اندازی
-------------------

برای استفاده از این اسکریپت، به دو ابزار زیر نیاز دارید:

1.  [**AutoHotkey**](https://www.autohotkey.com/)**:** یک ابزار اتوماسیون قدرتمند برای ویندوز.
    
2.  [**NirCmd**](https://www.nirsoft.net/utils/nircmd.html)**:** یک ابزار خط فرمان کوچک برای اجرای دستورات مختلف در ویندوز.
    

### ۱. نصب NirCmd

فایل nircmd.exe را دانلود کرده و آن را در پوشه **C:\\Windows** کپی کنید. این کار به اسکریپت اجازه می‌دهد تا به راحتی از هر جایی به آن دسترسی داشته باشد.

### ۲. نصب AutoHotkey

[AutoHotkey](https://www.autohotkey.com/) را دانلود و روی سیستم خود نصب کنید.

### 💻 کد اسکریپت

پس از نصب ابزارهای بالا، یک فایل جدید با پسوند **.ahk** (مثلاً AdobeConnect\_Audio.ahk) ایجاد کرده و کد زیر را در آن کپی کنید:

```
;-----------------------------------------------------------------------------
; This script provides hotkeys to mute/unmute the volume of the Adobe Connect application only.
; It uses the NirCmd utility to interact with the Windows Volume Mixer.
;-----------------------------------------------------------------------------

; Set the title match mode to find partial window titles.
SetTitleMatchMode, 2

;-----------------------------------------------------------------------------
; Hotkey definition for Mute (Ctrl + Y)
;-----------------------------------------------------------------------------
^y::
; Check if the active window is Adobe Connect.
If WinActive("Adobe Connect")
{
    ; Get the Process ID (PID) of the active window (Adobe Connect)
    WinGet, pid, PID, A
    ; Use NirCmd to mute the application based on its PID
    Run, nircmd.exe mutesysapp 2 %pid% 1
}
Return

;-----------------------------------------------------------------------------
; Hotkey definition for Unmute (Ctrl + N)
;-----------------------------------------------------------------------------
^n::
; Check if the active window is Adobe Connect.
If WinActive("Adobe Connect")
{
    ; Get the Process ID (PID) of the active window (Adobe Connect)
    WinGet, pid, PID, A
    ; Use NirCmd to unmute the application based on its PID
    Run, nircmd.exe mutesysapp 2 %pid% 0
}
Return

; To quit the script, right-click the green 'H' icon in the system tray and select Exit.
```

فایل .ahk را با دوبار کلیک اجرا کنید. یک آیکون سبز رنگ H در کنار ساعت ویندوز ظاهر می‌شود که نشان‌دهنده فعال بودن اسکریپت است.

### ۵. استفاده از میان‌برها

*   پنجره Adobe Connect را فعال کنید.
    
*   برای **قطع صدا:** Ctrl + Y را فشار دهید.
    
*   برای **وصل صدا:** Ctrl + N را فشار دهید.
    

⚠️ عیب‌یابی (Troubleshooting)
-----------------------------

اگر اسکریپت کار نکرد، ممکن است عنوان پنجره شما متفاوت باشد. می‌توانید با استفاده از ابزار **Window Spy** که همراه با AutoHotkey نصب می‌شود، عنوان دقیق پنجره Adobe Connect را پیدا کرده و در خط If WinActive("...") جایگزین کنید.
