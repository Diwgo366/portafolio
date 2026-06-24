flutter build web --output=docs --base-href=/portafolio/ --no-tree-shake-icons
Set-Location docs
git add .
git commit -m "Actualiza portafolio"
git push
Set-Location ..
