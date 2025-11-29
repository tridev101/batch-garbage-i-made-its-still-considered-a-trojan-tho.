@echo off
powershell -command ^
"Add-Type -AssemblyName System.Windows.Forms, System.Drawing; ^
$form = New-Object System.Windows.Forms.Form; ^
$form.FormBorderStyle = 'None'; ^
$form.TopMost = $true; ^
$form.BackColor = 'Black'; ^
$form.Opacity = 0.15; ^
$form.WindowState = 'Maximized'; ^
$form.Show(); ^
$g = $form.CreateGraphics(); ^
$rand = New-Object System.Random; ^
$stop = (Get-Date).AddSeconds(5); ^
while((Get-Date) -lt $stop){ ^
    $x = $rand.Next(0, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width); ^
    $y = $rand.Next(0, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height); ^
    $w = $rand.Next(50,300); ^
    $h = $rand.Next(50,300); ^
    $color = [System.Drawing.Color]::FromArgb($rand.Next(255),$rand.Next(255),$rand.Next(255)); ^
    $pen = New-Object System.Drawing.Pen($color,3); ^
    $g.DrawRectangle($pen,$x,$y,$w,$h); ^
    Start-Sleep -Milliseconds 40; ^
}; ^
$form.Close()"
exit
