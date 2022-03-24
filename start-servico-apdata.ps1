$servico = @(
  "FakeService3",
  "FakeService4",
  "FakeService5",
  "FakeService6",
  "FakeService7",
  "FakeService8"
)

while ((Get-Service -Name $servico[$i]).Status -ne "Runing") {
  Start-Sleep -Seconds 10
  Start-Service -Name $servico[$i]
  $i++
}
