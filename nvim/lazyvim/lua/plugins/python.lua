return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportAttributeAccessIssue = "none",
                  reportUnknownMemberType = "none",
                  reportUnknownVariableType = "none",
                  reportUnknownArgumentType = "none",
                  reportUnknownLambdaType = "none",
                  reportUnusedCallResult = "none",
                },
              },
            },
          },
        },
      },
    },
  },
}
