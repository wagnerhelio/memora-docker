
Write-Host "🧪 Verificando sincronização entre host e container..."

$testFile = "memora/perform/views.py"
$marker = "# TESTE_SYNC"

if (!(Test-Path $testFile)) {
    Write-Host "❌ Arquivo '$testFile' não encontrado. Rode este script na raiz do projeto (onde está docker-compose.yml)."
    exit 1
}

Add-Content -Path $testFile -Value $marker

Write-Host "✅ Comentário de teste adicionado ao final de $testFile"
Write-Host ""
Write-Host "Agora acesse a aplicação (http://localhost:8000/) e veja se a mudança refletiu automaticamente."
Write-Host "Depois, remova a linha '$marker' do arquivo para limpar o teste."
