variable "codefresh_host" {}

variable "codefresh_token" {}

variable "default_account_features" {
  type = map(any)
  default = {
    OfflineLogging                   = false,
    ssoManagement                    = true,
    teamsManagement                  = true,
    abac                             = true,
    customKubernetesCluster          = true,
    launchDarklyManagement           = false,
    kubeMonitor                      = true,
    saml                             = true,
    newPipelineViewEnabled           = true,
    ldap                             = true,
    hideRepositoriesFeature          = true,
    newPricing                       = true,
    pipelineInfoEnable               = true,
    internalRegistryFeature          = true,
    nestedBuilds                     = true,
    debugFeature                     = false,
    debugUnlimited                   = true,
    removeDoubleSlashInBuildLink     = true,
    ignoreIDPErrorsInWorkflowUser    = true,
    advancedYamlValidation           = true,
    refactoredEventValidationLogic   = true,
    newEventValidationLogicForGitlab = true,
    helm3                            = true,
    favoriteChanges                  = true,
    githubPackageMigration           = true,
    removalOfRegistryStep1           = true,
    executeNewImageModelLogic        = true,
    helm3NewUIFeature                = true,
    secretStore                      = true,
    helmOptimizedQueue               = true,
    newYamlFromRepoView              = true,
    relyOnNewImageModelLogic         = true,
    helmRepositoriesOnboarding       = true,
    engineHealthChecks               = true,
    logMasking                       = true,
    githubApp                        = true,
    newAgentEntity                   = true,
    pipelinePvcFlag                  = true,
    multipleRegistries               = true, # to allow for multiple ECR integrations in the same AWS region (for multiple AWS accounts)
    pipelineEnforcementsFlag         = true, #to enable https://codefresh.io/docs/docs/administration/access-control/#pipeline-definition-restrictions
    useLoggedInAdminAudit            = true, #to enable enhanced audit logging for impersonation zendesk ticket #5874 
    inactive                         = true, #to enable https://codefresh.io/docs/docs/administration/access-control/#security-timeout
  }
}
