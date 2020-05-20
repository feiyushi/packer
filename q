[1mdiff --git a/provisioner/powershell/provisioner_test.go b/provisioner/powershell/provisioner_test.go[m
[1mindex d120c0eb8..0b66e186c 100644[m
[1m--- a/provisioner/powershell/provisioner_test.go[m
[1m+++ b/provisioner/powershell/provisioner_test.go[m
[36m@@ -427,7 +427,7 @@[m [mfunc TestProvisionerProvision_Inline(t *testing.T) {[m
 	}[m
 [m
 	cmd := comm.StartCmd.Command[m
[31m-	re := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/inlineScript\.ps1' }`)[m
[32m+[m	[32mre := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/inlineScript\.ps1' }`)[m
 	matched := re.MatchString(cmd)[m
 	if !matched {[m
 		t.Fatalf("Got unexpected command: %s", cmd)[m
[36m@@ -447,7 +447,7 @@[m [mfunc TestProvisionerProvision_Inline(t *testing.T) {[m
 	}[m
 [m
 	cmd = comm.StartCmd.Command[m
[31m-	re = regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/inlineScript\.ps1' }`)[m
[32m+[m	[32mre = regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/inlineScript\.ps1' }`)[m
 	matched = re.MatchString(cmd)[m
 	if !matched {[m
 		t.Fatalf("Got unexpected command: %s", cmd)[m
[36m@@ -477,7 +477,7 @@[m [mfunc TestProvisionerProvision_Scripts(t *testing.T) {[m
 	}[m
 [m
 	cmd := comm.StartCmd.Command[m
[31m-	re := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/script\.ps1' }`)[m
[32m+[m	[32mre := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/script\.ps1' }`)[m
 	matched := re.MatchString(cmd)[m
 	if !matched {[m
 		t.Fatalf("Got unexpected command: %s", cmd)[m
[36m@@ -514,7 +514,7 @@[m [mfunc TestProvisionerProvision_ScriptsWithEnvVars(t *testing.T) {[m
 	}[m
 [m
 	cmd := comm.StartCmd.Command[m
[31m-	re := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/script\.ps1' }`)[m
[32m+[m	[32mre := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/script\.ps1' }`)[m
 	matched := re.MatchString(cmd)[m
 	if !matched {[m
 		t.Fatalf("Got unexpected command: %s", cmd)[m
[36m@@ -539,11 +539,11 @@[m [mfunc TestProvisionerProvision_SkipClean(t *testing.T) {[m
 	}{[m
 		{[m
 			SkipClean:                true,[m
[31m-			LastExecutedCommandRegex: `\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/script.ps1' }`,[m
[32m+[m			[32mLastExecutedCommandRegex: `\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/script.ps1' }`,[m
 		},[m
 		{[m
 			SkipClean:                false,[m
[31m-			LastExecutedCommandRegex: `\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/packer-cleanup-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1' }`,[m
[32m+[m			[32mLastExecutedCommandRegex: `\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/packer-cleanup-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1' }`,[m
 		},[m
 	}[m
 [m
[36m@@ -803,7 +803,7 @@[m [mfunc TestProvision_createCommandText(t *testing.T) {[m
 	p.generatedData = make(map[string]interface{})[m
 	cmd, _ := p.createCommandText()[m
 [m
[31m-	re := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { \. 'c:/Windows/Temp/script\.ps1' }`)[m
[32m+[m	[32mre := regexp.MustCompile(`\. c:/Windows/Temp/packer-ps-env-vars-[[:alnum:]]{8}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{4}-[[:alnum:]]{12}\.ps1;try { & 'c:/Windows/Temp/script\.ps1' }`)[m
 	matched := re.MatchString(cmd)[m
 	if !matched {[m
 		t.Fatalf("Got unexpected command: %s", cmd)[m
[36m@@ -864,5 +864,5 @@[m [mfunc generatedData() map[string]interface{} {[m
 }[m
 [m
 func executeCommand(varsStr, pathStr string) string {[m
[31m-	return fmt.Sprintf(`powershell -executionpolicy bypass "& { if (Test-Path variable:global:ProgressPreference){set-variable -name variable:global:ProgressPreference -value 'SilentlyContinue'};{set-variable -name variable:global:ErrorActionPreference -value 'Continue'};%s;try { . '%s' } catch { Write-Error $Error[0]; exit 1 }; exit $LastExitCode }"`, varsStr, pathStr)[m
[32m+[m	[32mreturn fmt.Sprintf(`powershell -executionpolicy bypass "& { if (Test-Path variable:global:ProgressPreference){set-variable -name variable:global:ProgressPreference -value 'SilentlyContinue'};{set-variable -name variable:global:ErrorActionPreference -value 'Continue'};%s;try { & '%s' } catch { Write-Error $Error[0]; exit 1 }; if ($LastExitCode) { exit $LastExitCode }}"`, varsStr, pathStr)[m
 }[m
[1mdiff --git a/provisioner/powershell/test-fixtures/powershell-exit_codes-provisioner.txt b/provisioner/powershell/test-fixtures/powershell-exit_codes-provisioner.txt[m
[1mindex a8bfca090..aa1068dbe 100644[m
[1m--- a/provisioner/powershell/test-fixtures/powershell-exit_codes-provisioner.txt[m
[1m+++ b/provisioner/powershell/test-fixtures/powershell-exit_codes-provisioner.txt[m
[36m@@ -14,6 +14,8 @@[m
 },[m
 {[m
   "type": "powershell",[m
[32m+[m[32m  "elevated_user": "Administrator",[m
[32m+[m[32m  "elevated_password": "{{.WinRMPassword}}",[m
   "inline": "sc.exe start Life",[m
   "valid_exit_codes": ["1060"][m
 }[m
[1mdiff --git a/provisioner/powershell/test-fixtures/scripts/set_version_latest.ps1 b/provisioner/powershell/test-fixtures/scripts/set_version_latest.ps1[m
[1mindex a8bbfff22..4d05fd5f7 100644[m
[1m--- a/provisioner/powershell/test-fixtures/scripts/set_version_latest.ps1[m
[1m+++ b/provisioner/powershell/test-fixtures/scripts/set_version_latest.ps1[m
[36m@@ -1,19 +1,13 @@[m
 Set-StrictMode -Version Latest[m
 $ErrorActionPreference = "Stop"[m
 [m
[31m-function test[m
[31m-{[m
[31m-[m
[31m-    $myNumbersCollection = 1..5[m
[32m+[m[32m$myNumbersCollection = 1..5[m
 [m
[31m-    if($myNumbersCollection -contains 3)[m
[31m-    {[m
[31m-        "collection contains 3"[m
[31m-    }[m
[31m-    else[m
[31m-    {[m
[31m-        "collection doesn't contain 3"[m
[31m-    }[m
[32m+[m[32mif($myNumbersCollection -contains 3)[m
[32m+[m[32m{[m
[32m+[m[32m    "collection contains 3"[m
[32m+[m[32m}[m
[32m+[m[32melse[m
[32m+[m[32m{[m
[32m+[m[32m    "collection doesn't contain 3"[m
 }[m
[31m-[m
[31m-test[m
