$rgName = 'pepper-poc-rg'
$location = 'australiaeast'

if (!($rg = Get-AzResourceGroup -Name $rgName -Location $location -ErrorAction SilentlyContinue)) {
	$rg = New-AzResourceGroup -Name $rgName -Location $location -Verbose
}

New-AzResourceGroupDeployment `
	-Name "pepper-poc-deploy" `
	-ResourceGroupName $rg.ResourceGroupName `
	-TemplateFile ./azuredeploy.json `
	-Location $location `
	-Verbose
