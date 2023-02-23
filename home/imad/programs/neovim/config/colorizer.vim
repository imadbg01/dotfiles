lua <<  EOF

  require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        names = true, -- "Name" codes like Blue or blue
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext", -- Set the display mode.
        tailwind = false, -- Enable tailwind colors
        virtualtext = "■",
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
  }

EOF
