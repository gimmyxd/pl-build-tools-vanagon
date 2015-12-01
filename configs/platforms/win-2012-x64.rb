platform "win-2012-x64" do |plat|
  plat.vmpooler_template "win-2012r2-x86_64"

  # We need to ensure we install chocolatey prior to adding any nuget repos. Otherwise, everything will fall over
  plat.add_build_repository "http://buildsources.delivery.puppetlabs.net/windows/chocolatey/install-chocolatey.ps1"
  plat.add_build_repository "http://nexus.delivery.puppetlabs.net/service/local/nuget/temp-build-tools/"
  plat.add_build_repository "http://nexus.delivery.puppetlabs.net/service/local/nuget/nuget-pl-build-tools/"

  plat.provision_with "C:/ProgramData/chocolatey/bin/choco.exe install -y mingw-w64 -version 5.2.0 -debug"

  plat.install_build_dependencies_with "C:/ProgramData/chocolatey/bin/choco.exe install -y"

  plat.make "/cygdrive/c/tools/mingw64/bin/mingw32-make"
end