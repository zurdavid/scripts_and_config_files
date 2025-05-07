vim.opt.shiftwidth = 2

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local home = os.getenv("HOME")
local launcher_jar = vim.fn.glob(home .. "/Apps/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

local workspace_dir = home .. '/coding/java/nvim-ws/' .. project_name

-- local lombok_path = "c:/dev/e0112485/temp/lombok/lombok-1.18.38.jar"

local jdtls = require('jdtls')

local bundles = { 
    vim.fn.glob(home .. '/.vscode/extensions/vscjava.vscode-java-debug-0.58.2/server/com.microsoft.java.debug.plugin-*.jar', 1) 
}

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/.vscode/extensions/vscjava.vscode-java-test-0.43.1/server/*.jar', 1), '\n'))

--print(vim.inspect(bundles))

local cmd =  {
    home .. '/Apps/jdk-21/bin/java',
    -- '-javaagent:' .. lombok_path, 
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '--enable-native-access=ALL-UNNAMED',
    '-jar', launcher_jar,
    '-configuration', home .. '/Apps/jdtls/config_linux/',
    -- See `data directory configuration` section in the README
    '-data', workspace_dir 
}

local config = {
    cmd = cmd,  
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
          saveActions = {
            organizeImports = true,
          },
          completion = {
            importOrder = { "", "#" },
            favoriteStaticMembers = {
              "java.util.Objects.nonNull",
              "java.util.Objects.isNull",
              "org.hamcrest.MatcherAssert.assertThat",
              }
          },
          configuration = {
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = home .. "/Apps/jdk-8",
              },
              {
                name = "JavaSE-21",
                path = home .. "/Apps/jdk-21",
              },
              {
                name = "JavaSE-23",
                path = home .. "/Apps/jdk-23",
              },
              {
                name = "JavaSE-24",
                path = "/usr/lib/jvm/java-24-openjdk",
              },
            }
          }
        },
    },
    init_options = {
        bundles = bundles,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', "<leader>oi", jdtls.organize_imports, opts)
        -- Should 'd' be reserved for debug?
        vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
        vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
        vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, opts)
        vim.keymap.set('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
          { desc = 'Extract method', buffer = bufnr })
        vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, opts)

        vim.keymap.set('n', 'gi', function()
            require('telescope.builtin').lsp_implementations({
              path_display = { 'smart' }
            })
        end, opts)
        vim.keymap.set('n', 'gr', function()
            require('telescope.builtin').lsp_references({
              path_display = { 'smart' }
            })
        end, opts)

        -- allgemeine
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.keymap.set('n', '<Leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help({border = "rounded"})<CR>', opts)
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = "rounded", max_width = 90 })<CR>', opts)
        --
        vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    end
}


jdtls.start_or_attach(config)

jdtls.setup_dap()

-- dap-ui
require("dapui").setup()

--local dap, dapui = require("dap"), require("dapui")
--dap.listeners.before.attach.dapui_config = function()
--  dapui.open()
--end
--dap.listeners.before.launch.dapui_config = function()
--  dapui.open()
--end
--dap.listeners.before.event_terminated.dapui_config = function()
--  dapui.close()
--end
--dap.listeners.before.event_exited.dapui_config = function()
--  dapui.close()
--end
