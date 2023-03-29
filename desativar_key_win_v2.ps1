# Pergunta ao usuário se deseja ativar ou desativar a tecla "Windows"
write-host -b Yellow "Para as modificações terem efeito esse script reiniciara seu PC"
$choice = Read-Host "Você deseja ativar (A) ou desativar (D) a tecla Windows? (A/D)"

if ($choice -eq "A") {
    # Ativa a tecla "Windows"
    Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -ErrorAction SilentlyContinue
    Write-Host "Tecla Windows ativada com sucesso!" -b Blue
    Write-Host -b Yellow "seu pc sera reiniciado deseja continuar..."
    Pause
    Restart-Computer
} elseif ($choice -eq "D") {
    # Desativa a tecla "Windows"
    #se der erro teste essas formas de representar o binario.
    #$hexScancodeMap = "00000000000000000300000000005BE000005CE0000000000"
    #$hexScancodeMap = "00000000000000000300000000005BE0,00005CE0,0000000000000000"
    $hexScancodeMap = "00,00,00,00,00,00,00,00,03,00,00,00,00,00,5B,E0,00,00,5C,E0,00,00,00,00,00,00,00,00,00,00,00,00"

    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -Value ([byte[]]([convert]::ToByte($hexScancodeMap, 16))) -PropertyType Binary -Force | Out-Null
    Write-Host "Tecla Windows desativada com sucesso!" -b Blue
    Write-Host -b Yellow "seu pc sera reiniciado deseja continuar"
    Pause
    Restart-Computer
} else {
    # Informa ao usuário que uma opção inválida foi selecionada
    Write-Host "Opção inválida selecionada. Tente novamente." -b red
}
