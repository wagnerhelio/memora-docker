echo "🧪 Verificando sincronização entre host e container..."

$testFile = "memora/perform/views.py"
$marker = "# TESTE_SYNC"

if (!(Test-Path $testFile)) {
  Write-Host "❌ Arquivo '$testFile' não encontrado. Rode o script na raiz do projeto."
  exit 1
}

Add-Content $testFile $marker

Write-Host "✅ Comentário de teste adicionado em $testFile"
Write-Host "Acesse a aplicação e veja se ela recarrega automaticamente."
Write-Host ""
Write-Host "Depois, remova a linha '$marker' para limpar o teste."
