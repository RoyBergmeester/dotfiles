vim.pack.add({'https://github.com/neovim/nvim-lspconfig'})

local capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.config("intelephense", {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_markers = { "composer.json", ".git" },
    init_options = {
        licenceKey = "REDACTED",
        globalStoragePath = vim.fn.expand("~/intelephense"),
    },
    settings = {
        intelephense = {
            diagnostics = { undefinedFunctions = false },
            files = { maxSize = 5000000 },
            environment = { includePaths = { vim.fn.getcwd() .. "/vendor" }, phpVersion = "8.4.15" },
            stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype",
                "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo",
                "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap",
                "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8",
                "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql",
                "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline",
                "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets",
                "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg",
                "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
                "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib", "Symfony",
            },
            parameterNames = { enabled = "all" },
            inlayHints = {
                parameterTypes = { enabled = true },
                returnTypes = { enabled = true },
                variableTypes = { enabled = true },
            },
        },
    },
})

vim.lsp.inlay_hint.enable(true)
vim.lsp.enable({'lua_ls', 'intelephense'})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf

        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = buf })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = buf })
        vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = buf })
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = buf })
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "LSP Rename symbol" })
    end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [severity.ERROR] = " ",
            [severity.WARN] = " ",
            [severity.INFO] = " ",
            [severity.HINT] = " ",
        },
        numhl = {
            [severity.ERROR] = "ErrorMsg",
            [severity.WARN] = "WarningMsg",
        },
    },
})

