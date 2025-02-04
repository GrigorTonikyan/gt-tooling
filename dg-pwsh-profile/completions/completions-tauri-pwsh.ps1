
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'cargo' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'cargo'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'cargo' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;android;help;init' {
            break
        }
        'cargo;tauri;android;help;dev' {
            break
        }
        'cargo;tauri;android;help;build' {
            break
        }
        'cargo;tauri;android;help;android-studio-script' {
            break
        }
        'cargo;tauri;android;help;help' {
            break
        }
        'cargo;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;android;help;init' {
            break
        }
        'cargo;tauri;plugin;android;help;help' {
            break
        }
        'cargo;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;ios;help;init' {
            break
        }
        'cargo;tauri;plugin;ios;help;help' {
            break
        }
        'cargo;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;plugin;help;new' {
            break
        }
        'cargo;tauri;plugin;help;init' {
            break
        }
        'cargo;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'cargo;tauri;plugin;help;android;init' {
            break
        }
        'cargo;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'cargo;tauri;plugin;help;ios;init' {
            break
        }
        'cargo;tauri;plugin;help;help' {
            break
        }
        'cargo;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;signer;help;sign' {
            break
        }
        'cargo;tauri;signer;help;generate' {
            break
        }
        'cargo;tauri;signer;help;help' {
            break
        }
        'cargo;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;permission;help;new' {
            break
        }
        'cargo;tauri;permission;help;add' {
            break
        }
        'cargo;tauri;permission;help;rm' {
            break
        }
        'cargo;tauri;permission;help;ls' {
            break
        }
        'cargo;tauri;permission;help;help' {
            break
        }
        'cargo;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;capability;help;new' {
            break
        }
        'cargo;tauri;capability;help;help' {
            break
        }
        'cargo;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'cargo;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'cargo;tauri;inspect;help;help' {
            break
        }
        'cargo;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;tauri;help;init' {
            break
        }
        'cargo;tauri;help;dev' {
            break
        }
        'cargo;tauri;help;build' {
            break
        }
        'cargo;tauri;help;bundle' {
            break
        }
        'cargo;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'cargo;tauri;help;android;init' {
            break
        }
        'cargo;tauri;help;android;dev' {
            break
        }
        'cargo;tauri;help;android;build' {
            break
        }
        'cargo;tauri;help;android;android-studio-script' {
            break
        }
        'cargo;tauri;help;migrate' {
            break
        }
        'cargo;tauri;help;info' {
            break
        }
        'cargo;tauri;help;add' {
            break
        }
        'cargo;tauri;help;remove' {
            break
        }
        'cargo;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'cargo;tauri;help;plugin;new' {
            break
        }
        'cargo;tauri;help;plugin;init' {
            break
        }
        'cargo;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'cargo;tauri;help;plugin;android;init' {
            break
        }
        'cargo;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'cargo;tauri;help;plugin;ios;init' {
            break
        }
        'cargo;tauri;help;icon' {
            break
        }
        'cargo;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'cargo;tauri;help;signer;sign' {
            break
        }
        'cargo;tauri;help;signer;generate' {
            break
        }
        'cargo;tauri;help;completions' {
            break
        }
        'cargo;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'cargo;tauri;help;permission;new' {
            break
        }
        'cargo;tauri;help;permission;add' {
            break
        }
        'cargo;tauri;help;permission;rm' {
            break
        }
        'cargo;tauri;help;permission;ls' {
            break
        }
        'cargo;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'cargo;tauri;help;capability;new' {
            break
        }
        'cargo;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'cargo;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'cargo;tauri;help;help' {
            break
        }
        'cargo;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'cargo;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'cargo;help;tauri;init' {
            break
        }
        'cargo;help;tauri;dev' {
            break
        }
        'cargo;help;tauri;build' {
            break
        }
        'cargo;help;tauri;bundle' {
            break
        }
        'cargo;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'cargo;help;tauri;android;init' {
            break
        }
        'cargo;help;tauri;android;dev' {
            break
        }
        'cargo;help;tauri;android;build' {
            break
        }
        'cargo;help;tauri;android;android-studio-script' {
            break
        }
        'cargo;help;tauri;migrate' {
            break
        }
        'cargo;help;tauri;info' {
            break
        }
        'cargo;help;tauri;add' {
            break
        }
        'cargo;help;tauri;remove' {
            break
        }
        'cargo;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'cargo;help;tauri;plugin;new' {
            break
        }
        'cargo;help;tauri;plugin;init' {
            break
        }
        'cargo;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'cargo;help;tauri;plugin;android;init' {
            break
        }
        'cargo;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'cargo;help;tauri;plugin;ios;init' {
            break
        }
        'cargo;help;tauri;icon' {
            break
        }
        'cargo;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'cargo;help;tauri;signer;sign' {
            break
        }
        'cargo;help;tauri;signer;generate' {
            break
        }
        'cargo;help;tauri;completions' {
            break
        }
        'cargo;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'cargo;help;tauri;permission;new' {
            break
        }
        'cargo;help;tauri;permission;add' {
            break
        }
        'cargo;help;tauri;permission;rm' {
            break
        }
        'cargo;help;tauri;permission;ls' {
            break
        }
        'cargo;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'cargo;help;tauri;capability;new' {
            break
        }
        'cargo;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'cargo;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'cargo;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}





Register-ArgumentCompleter -Native -CommandName 'pnpm' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'pnpm'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'pnpm' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;android;help;init' {
            break
        }
        'pnpm;tauri;android;help;dev' {
            break
        }
        'pnpm;tauri;android;help;build' {
            break
        }
        'pnpm;tauri;android;help;android-studio-script' {
            break
        }
        'pnpm;tauri;android;help;help' {
            break
        }
        'pnpm;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;android;help;init' {
            break
        }
        'pnpm;tauri;plugin;android;help;help' {
            break
        }
        'pnpm;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;ios;help;init' {
            break
        }
        'pnpm;tauri;plugin;ios;help;help' {
            break
        }
        'pnpm;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;plugin;help;new' {
            break
        }
        'pnpm;tauri;plugin;help;init' {
            break
        }
        'pnpm;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'pnpm;tauri;plugin;help;android;init' {
            break
        }
        'pnpm;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'pnpm;tauri;plugin;help;ios;init' {
            break
        }
        'pnpm;tauri;plugin;help;help' {
            break
        }
        'pnpm;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;signer;help;sign' {
            break
        }
        'pnpm;tauri;signer;help;generate' {
            break
        }
        'pnpm;tauri;signer;help;help' {
            break
        }
        'pnpm;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;permission;help;new' {
            break
        }
        'pnpm;tauri;permission;help;add' {
            break
        }
        'pnpm;tauri;permission;help;rm' {
            break
        }
        'pnpm;tauri;permission;help;ls' {
            break
        }
        'pnpm;tauri;permission;help;help' {
            break
        }
        'pnpm;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;capability;help;new' {
            break
        }
        'pnpm;tauri;capability;help;help' {
            break
        }
        'pnpm;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'pnpm;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'pnpm;tauri;inspect;help;help' {
            break
        }
        'pnpm;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;tauri;help;init' {
            break
        }
        'pnpm;tauri;help;dev' {
            break
        }
        'pnpm;tauri;help;build' {
            break
        }
        'pnpm;tauri;help;bundle' {
            break
        }
        'pnpm;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'pnpm;tauri;help;android;init' {
            break
        }
        'pnpm;tauri;help;android;dev' {
            break
        }
        'pnpm;tauri;help;android;build' {
            break
        }
        'pnpm;tauri;help;android;android-studio-script' {
            break
        }
        'pnpm;tauri;help;migrate' {
            break
        }
        'pnpm;tauri;help;info' {
            break
        }
        'pnpm;tauri;help;add' {
            break
        }
        'pnpm;tauri;help;remove' {
            break
        }
        'pnpm;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'pnpm;tauri;help;plugin;new' {
            break
        }
        'pnpm;tauri;help;plugin;init' {
            break
        }
        'pnpm;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'pnpm;tauri;help;plugin;android;init' {
            break
        }
        'pnpm;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'pnpm;tauri;help;plugin;ios;init' {
            break
        }
        'pnpm;tauri;help;icon' {
            break
        }
        'pnpm;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'pnpm;tauri;help;signer;sign' {
            break
        }
        'pnpm;tauri;help;signer;generate' {
            break
        }
        'pnpm;tauri;help;completions' {
            break
        }
        'pnpm;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'pnpm;tauri;help;permission;new' {
            break
        }
        'pnpm;tauri;help;permission;add' {
            break
        }
        'pnpm;tauri;help;permission;rm' {
            break
        }
        'pnpm;tauri;help;permission;ls' {
            break
        }
        'pnpm;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'pnpm;tauri;help;capability;new' {
            break
        }
        'pnpm;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'pnpm;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'pnpm;tauri;help;help' {
            break
        }
        'pnpm;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pnpm;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'pnpm;help;tauri;init' {
            break
        }
        'pnpm;help;tauri;dev' {
            break
        }
        'pnpm;help;tauri;build' {
            break
        }
        'pnpm;help;tauri;bundle' {
            break
        }
        'pnpm;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'pnpm;help;tauri;android;init' {
            break
        }
        'pnpm;help;tauri;android;dev' {
            break
        }
        'pnpm;help;tauri;android;build' {
            break
        }
        'pnpm;help;tauri;android;android-studio-script' {
            break
        }
        'pnpm;help;tauri;migrate' {
            break
        }
        'pnpm;help;tauri;info' {
            break
        }
        'pnpm;help;tauri;add' {
            break
        }
        'pnpm;help;tauri;remove' {
            break
        }
        'pnpm;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'pnpm;help;tauri;plugin;new' {
            break
        }
        'pnpm;help;tauri;plugin;init' {
            break
        }
        'pnpm;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'pnpm;help;tauri;plugin;android;init' {
            break
        }
        'pnpm;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'pnpm;help;tauri;plugin;ios;init' {
            break
        }
        'pnpm;help;tauri;icon' {
            break
        }
        'pnpm;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'pnpm;help;tauri;signer;sign' {
            break
        }
        'pnpm;help;tauri;signer;generate' {
            break
        }
        'pnpm;help;tauri;completions' {
            break
        }
        'pnpm;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'pnpm;help;tauri;permission;new' {
            break
        }
        'pnpm;help;tauri;permission;add' {
            break
        }
        'pnpm;help;tauri;permission;rm' {
            break
        }
        'pnpm;help;tauri;permission;ls' {
            break
        }
        'pnpm;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'pnpm;help;tauri;capability;new' {
            break
        }
        'pnpm;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'pnpm;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'pnpm;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}





Register-ArgumentCompleter -Native -CommandName 'npm' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'npm'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'npm' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'run')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;android;help;init' {
            break
        }
        'npm;run;tauri;android;help;dev' {
            break
        }
        'npm;run;tauri;android;help;build' {
            break
        }
        'npm;run;tauri;android;help;android-studio-script' {
            break
        }
        'npm;run;tauri;android;help;help' {
            break
        }
        'npm;run;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;android;help;init' {
            break
        }
        'npm;run;tauri;plugin;android;help;help' {
            break
        }
        'npm;run;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;ios;help;init' {
            break
        }
        'npm;run;tauri;plugin;ios;help;help' {
            break
        }
        'npm;run;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;plugin;help;new' {
            break
        }
        'npm;run;tauri;plugin;help;init' {
            break
        }
        'npm;run;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'npm;run;tauri;plugin;help;android;init' {
            break
        }
        'npm;run;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'npm;run;tauri;plugin;help;ios;init' {
            break
        }
        'npm;run;tauri;plugin;help;help' {
            break
        }
        'npm;run;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;signer;help;sign' {
            break
        }
        'npm;run;tauri;signer;help;generate' {
            break
        }
        'npm;run;tauri;signer;help;help' {
            break
        }
        'npm;run;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;permission;help;new' {
            break
        }
        'npm;run;tauri;permission;help;add' {
            break
        }
        'npm;run;tauri;permission;help;rm' {
            break
        }
        'npm;run;tauri;permission;help;ls' {
            break
        }
        'npm;run;tauri;permission;help;help' {
            break
        }
        'npm;run;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;capability;help;new' {
            break
        }
        'npm;run;tauri;capability;help;help' {
            break
        }
        'npm;run;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'npm;run;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'npm;run;tauri;inspect;help;help' {
            break
        }
        'npm;run;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;tauri;help;init' {
            break
        }
        'npm;run;tauri;help;dev' {
            break
        }
        'npm;run;tauri;help;build' {
            break
        }
        'npm;run;tauri;help;bundle' {
            break
        }
        'npm;run;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'npm;run;tauri;help;android;init' {
            break
        }
        'npm;run;tauri;help;android;dev' {
            break
        }
        'npm;run;tauri;help;android;build' {
            break
        }
        'npm;run;tauri;help;android;android-studio-script' {
            break
        }
        'npm;run;tauri;help;migrate' {
            break
        }
        'npm;run;tauri;help;info' {
            break
        }
        'npm;run;tauri;help;add' {
            break
        }
        'npm;run;tauri;help;remove' {
            break
        }
        'npm;run;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'npm;run;tauri;help;plugin;new' {
            break
        }
        'npm;run;tauri;help;plugin;init' {
            break
        }
        'npm;run;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'npm;run;tauri;help;plugin;android;init' {
            break
        }
        'npm;run;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'npm;run;tauri;help;plugin;ios;init' {
            break
        }
        'npm;run;tauri;help;icon' {
            break
        }
        'npm;run;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'npm;run;tauri;help;signer;sign' {
            break
        }
        'npm;run;tauri;help;signer;generate' {
            break
        }
        'npm;run;tauri;help;completions' {
            break
        }
        'npm;run;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'npm;run;tauri;help;permission;new' {
            break
        }
        'npm;run;tauri;help;permission;add' {
            break
        }
        'npm;run;tauri;help;permission;rm' {
            break
        }
        'npm;run;tauri;help;permission;ls' {
            break
        }
        'npm;run;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'npm;run;tauri;help;capability;new' {
            break
        }
        'npm;run;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'npm;run;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'npm;run;tauri;help;help' {
            break
        }
        'npm;run;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;run;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'npm;run;help;tauri;init' {
            break
        }
        'npm;run;help;tauri;dev' {
            break
        }
        'npm;run;help;tauri;build' {
            break
        }
        'npm;run;help;tauri;bundle' {
            break
        }
        'npm;run;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'npm;run;help;tauri;android;init' {
            break
        }
        'npm;run;help;tauri;android;dev' {
            break
        }
        'npm;run;help;tauri;android;build' {
            break
        }
        'npm;run;help;tauri;android;android-studio-script' {
            break
        }
        'npm;run;help;tauri;migrate' {
            break
        }
        'npm;run;help;tauri;info' {
            break
        }
        'npm;run;help;tauri;add' {
            break
        }
        'npm;run;help;tauri;remove' {
            break
        }
        'npm;run;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'npm;run;help;tauri;plugin;new' {
            break
        }
        'npm;run;help;tauri;plugin;init' {
            break
        }
        'npm;run;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'npm;run;help;tauri;plugin;android;init' {
            break
        }
        'npm;run;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'npm;run;help;tauri;plugin;ios;init' {
            break
        }
        'npm;run;help;tauri;icon' {
            break
        }
        'npm;run;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'npm;run;help;tauri;signer;sign' {
            break
        }
        'npm;run;help;tauri;signer;generate' {
            break
        }
        'npm;run;help;tauri;completions' {
            break
        }
        'npm;run;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'npm;run;help;tauri;permission;new' {
            break
        }
        'npm;run;help;tauri;permission;add' {
            break
        }
        'npm;run;help;tauri;permission;rm' {
            break
        }
        'npm;run;help;tauri;permission;ls' {
            break
        }
        'npm;run;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'npm;run;help;tauri;capability;new' {
            break
        }
        'npm;run;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'npm;run;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'npm;run;help;help' {
            break
        }
        'npm;help' {
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'run')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'npm;help;run' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            break
        }
        'npm;help;run;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'npm;help;run;tauri;init' {
            break
        }
        'npm;help;run;tauri;dev' {
            break
        }
        'npm;help;run;tauri;build' {
            break
        }
        'npm;help;run;tauri;bundle' {
            break
        }
        'npm;help;run;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'npm;help;run;tauri;android;init' {
            break
        }
        'npm;help;run;tauri;android;dev' {
            break
        }
        'npm;help;run;tauri;android;build' {
            break
        }
        'npm;help;run;tauri;android;android-studio-script' {
            break
        }
        'npm;help;run;tauri;migrate' {
            break
        }
        'npm;help;run;tauri;info' {
            break
        }
        'npm;help;run;tauri;add' {
            break
        }
        'npm;help;run;tauri;remove' {
            break
        }
        'npm;help;run;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'npm;help;run;tauri;plugin;new' {
            break
        }
        'npm;help;run;tauri;plugin;init' {
            break
        }
        'npm;help;run;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'npm;help;run;tauri;plugin;android;init' {
            break
        }
        'npm;help;run;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'npm;help;run;tauri;plugin;ios;init' {
            break
        }
        'npm;help;run;tauri;icon' {
            break
        }
        'npm;help;run;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'npm;help;run;tauri;signer;sign' {
            break
        }
        'npm;help;run;tauri;signer;generate' {
            break
        }
        'npm;help;run;tauri;completions' {
            break
        }
        'npm;help;run;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'npm;help;run;tauri;permission;new' {
            break
        }
        'npm;help;run;tauri;permission;add' {
            break
        }
        'npm;help;run;tauri;permission;rm' {
            break
        }
        'npm;help;run;tauri;permission;ls' {
            break
        }
        'npm;help;run;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'npm;help;run;tauri;capability;new' {
            break
        }
        'npm;help;run;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'npm;help;run;tauri;inspect;wix-upgrade-code' {
            break
        }
        'npm;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}





Register-ArgumentCompleter -Native -CommandName 'yarn' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'yarn'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'yarn' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;android;help;init' {
            break
        }
        'yarn;tauri;android;help;dev' {
            break
        }
        'yarn;tauri;android;help;build' {
            break
        }
        'yarn;tauri;android;help;android-studio-script' {
            break
        }
        'yarn;tauri;android;help;help' {
            break
        }
        'yarn;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;android;help;init' {
            break
        }
        'yarn;tauri;plugin;android;help;help' {
            break
        }
        'yarn;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;ios;help;init' {
            break
        }
        'yarn;tauri;plugin;ios;help;help' {
            break
        }
        'yarn;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;plugin;help;new' {
            break
        }
        'yarn;tauri;plugin;help;init' {
            break
        }
        'yarn;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'yarn;tauri;plugin;help;android;init' {
            break
        }
        'yarn;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'yarn;tauri;plugin;help;ios;init' {
            break
        }
        'yarn;tauri;plugin;help;help' {
            break
        }
        'yarn;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;signer;help;sign' {
            break
        }
        'yarn;tauri;signer;help;generate' {
            break
        }
        'yarn;tauri;signer;help;help' {
            break
        }
        'yarn;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;permission;help;new' {
            break
        }
        'yarn;tauri;permission;help;add' {
            break
        }
        'yarn;tauri;permission;help;rm' {
            break
        }
        'yarn;tauri;permission;help;ls' {
            break
        }
        'yarn;tauri;permission;help;help' {
            break
        }
        'yarn;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;capability;help;new' {
            break
        }
        'yarn;tauri;capability;help;help' {
            break
        }
        'yarn;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'yarn;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'yarn;tauri;inspect;help;help' {
            break
        }
        'yarn;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;tauri;help;init' {
            break
        }
        'yarn;tauri;help;dev' {
            break
        }
        'yarn;tauri;help;build' {
            break
        }
        'yarn;tauri;help;bundle' {
            break
        }
        'yarn;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'yarn;tauri;help;android;init' {
            break
        }
        'yarn;tauri;help;android;dev' {
            break
        }
        'yarn;tauri;help;android;build' {
            break
        }
        'yarn;tauri;help;android;android-studio-script' {
            break
        }
        'yarn;tauri;help;migrate' {
            break
        }
        'yarn;tauri;help;info' {
            break
        }
        'yarn;tauri;help;add' {
            break
        }
        'yarn;tauri;help;remove' {
            break
        }
        'yarn;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'yarn;tauri;help;plugin;new' {
            break
        }
        'yarn;tauri;help;plugin;init' {
            break
        }
        'yarn;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'yarn;tauri;help;plugin;android;init' {
            break
        }
        'yarn;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'yarn;tauri;help;plugin;ios;init' {
            break
        }
        'yarn;tauri;help;icon' {
            break
        }
        'yarn;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'yarn;tauri;help;signer;sign' {
            break
        }
        'yarn;tauri;help;signer;generate' {
            break
        }
        'yarn;tauri;help;completions' {
            break
        }
        'yarn;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'yarn;tauri;help;permission;new' {
            break
        }
        'yarn;tauri;help;permission;add' {
            break
        }
        'yarn;tauri;help;permission;rm' {
            break
        }
        'yarn;tauri;help;permission;ls' {
            break
        }
        'yarn;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'yarn;tauri;help;capability;new' {
            break
        }
        'yarn;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'yarn;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'yarn;tauri;help;help' {
            break
        }
        'yarn;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'yarn;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'yarn;help;tauri;init' {
            break
        }
        'yarn;help;tauri;dev' {
            break
        }
        'yarn;help;tauri;build' {
            break
        }
        'yarn;help;tauri;bundle' {
            break
        }
        'yarn;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'yarn;help;tauri;android;init' {
            break
        }
        'yarn;help;tauri;android;dev' {
            break
        }
        'yarn;help;tauri;android;build' {
            break
        }
        'yarn;help;tauri;android;android-studio-script' {
            break
        }
        'yarn;help;tauri;migrate' {
            break
        }
        'yarn;help;tauri;info' {
            break
        }
        'yarn;help;tauri;add' {
            break
        }
        'yarn;help;tauri;remove' {
            break
        }
        'yarn;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'yarn;help;tauri;plugin;new' {
            break
        }
        'yarn;help;tauri;plugin;init' {
            break
        }
        'yarn;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'yarn;help;tauri;plugin;android;init' {
            break
        }
        'yarn;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'yarn;help;tauri;plugin;ios;init' {
            break
        }
        'yarn;help;tauri;icon' {
            break
        }
        'yarn;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'yarn;help;tauri;signer;sign' {
            break
        }
        'yarn;help;tauri;signer;generate' {
            break
        }
        'yarn;help;tauri;completions' {
            break
        }
        'yarn;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'yarn;help;tauri;permission;new' {
            break
        }
        'yarn;help;tauri;permission;add' {
            break
        }
        'yarn;help;tauri;permission;rm' {
            break
        }
        'yarn;help;tauri;permission;ls' {
            break
        }
        'yarn;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'yarn;help;tauri;capability;new' {
            break
        }
        'yarn;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'yarn;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'yarn;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}





Register-ArgumentCompleter -Native -CommandName 'bun' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'bun'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'bun' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'run')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;android;help;init' {
            break
        }
        'bun;run;tauri;android;help;dev' {
            break
        }
        'bun;run;tauri;android;help;build' {
            break
        }
        'bun;run;tauri;android;help;android-studio-script' {
            break
        }
        'bun;run;tauri;android;help;help' {
            break
        }
        'bun;run;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;android;help;init' {
            break
        }
        'bun;run;tauri;plugin;android;help;help' {
            break
        }
        'bun;run;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;ios;help;init' {
            break
        }
        'bun;run;tauri;plugin;ios;help;help' {
            break
        }
        'bun;run;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;plugin;help;new' {
            break
        }
        'bun;run;tauri;plugin;help;init' {
            break
        }
        'bun;run;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'bun;run;tauri;plugin;help;android;init' {
            break
        }
        'bun;run;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'bun;run;tauri;plugin;help;ios;init' {
            break
        }
        'bun;run;tauri;plugin;help;help' {
            break
        }
        'bun;run;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;signer;help;sign' {
            break
        }
        'bun;run;tauri;signer;help;generate' {
            break
        }
        'bun;run;tauri;signer;help;help' {
            break
        }
        'bun;run;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;permission;help;new' {
            break
        }
        'bun;run;tauri;permission;help;add' {
            break
        }
        'bun;run;tauri;permission;help;rm' {
            break
        }
        'bun;run;tauri;permission;help;ls' {
            break
        }
        'bun;run;tauri;permission;help;help' {
            break
        }
        'bun;run;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;capability;help;new' {
            break
        }
        'bun;run;tauri;capability;help;help' {
            break
        }
        'bun;run;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'bun;run;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'bun;run;tauri;inspect;help;help' {
            break
        }
        'bun;run;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;tauri;help;init' {
            break
        }
        'bun;run;tauri;help;dev' {
            break
        }
        'bun;run;tauri;help;build' {
            break
        }
        'bun;run;tauri;help;bundle' {
            break
        }
        'bun;run;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'bun;run;tauri;help;android;init' {
            break
        }
        'bun;run;tauri;help;android;dev' {
            break
        }
        'bun;run;tauri;help;android;build' {
            break
        }
        'bun;run;tauri;help;android;android-studio-script' {
            break
        }
        'bun;run;tauri;help;migrate' {
            break
        }
        'bun;run;tauri;help;info' {
            break
        }
        'bun;run;tauri;help;add' {
            break
        }
        'bun;run;tauri;help;remove' {
            break
        }
        'bun;run;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'bun;run;tauri;help;plugin;new' {
            break
        }
        'bun;run;tauri;help;plugin;init' {
            break
        }
        'bun;run;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'bun;run;tauri;help;plugin;android;init' {
            break
        }
        'bun;run;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'bun;run;tauri;help;plugin;ios;init' {
            break
        }
        'bun;run;tauri;help;icon' {
            break
        }
        'bun;run;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'bun;run;tauri;help;signer;sign' {
            break
        }
        'bun;run;tauri;help;signer;generate' {
            break
        }
        'bun;run;tauri;help;completions' {
            break
        }
        'bun;run;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'bun;run;tauri;help;permission;new' {
            break
        }
        'bun;run;tauri;help;permission;add' {
            break
        }
        'bun;run;tauri;help;permission;rm' {
            break
        }
        'bun;run;tauri;help;permission;ls' {
            break
        }
        'bun;run;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'bun;run;tauri;help;capability;new' {
            break
        }
        'bun;run;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'bun;run;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'bun;run;tauri;help;help' {
            break
        }
        'bun;run;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;run;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'bun;run;help;tauri;init' {
            break
        }
        'bun;run;help;tauri;dev' {
            break
        }
        'bun;run;help;tauri;build' {
            break
        }
        'bun;run;help;tauri;bundle' {
            break
        }
        'bun;run;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'bun;run;help;tauri;android;init' {
            break
        }
        'bun;run;help;tauri;android;dev' {
            break
        }
        'bun;run;help;tauri;android;build' {
            break
        }
        'bun;run;help;tauri;android;android-studio-script' {
            break
        }
        'bun;run;help;tauri;migrate' {
            break
        }
        'bun;run;help;tauri;info' {
            break
        }
        'bun;run;help;tauri;add' {
            break
        }
        'bun;run;help;tauri;remove' {
            break
        }
        'bun;run;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'bun;run;help;tauri;plugin;new' {
            break
        }
        'bun;run;help;tauri;plugin;init' {
            break
        }
        'bun;run;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'bun;run;help;tauri;plugin;android;init' {
            break
        }
        'bun;run;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'bun;run;help;tauri;plugin;ios;init' {
            break
        }
        'bun;run;help;tauri;icon' {
            break
        }
        'bun;run;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'bun;run;help;tauri;signer;sign' {
            break
        }
        'bun;run;help;tauri;signer;generate' {
            break
        }
        'bun;run;help;tauri;completions' {
            break
        }
        'bun;run;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'bun;run;help;tauri;permission;new' {
            break
        }
        'bun;run;help;tauri;permission;add' {
            break
        }
        'bun;run;help;tauri;permission;rm' {
            break
        }
        'bun;run;help;tauri;permission;ls' {
            break
        }
        'bun;run;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'bun;run;help;tauri;capability;new' {
            break
        }
        'bun;run;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'bun;run;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'bun;run;help;help' {
            break
        }
        'bun;help' {
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'run')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'bun;help;run' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            break
        }
        'bun;help;run;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'bun;help;run;tauri;init' {
            break
        }
        'bun;help;run;tauri;dev' {
            break
        }
        'bun;help;run;tauri;build' {
            break
        }
        'bun;help;run;tauri;bundle' {
            break
        }
        'bun;help;run;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'bun;help;run;tauri;android;init' {
            break
        }
        'bun;help;run;tauri;android;dev' {
            break
        }
        'bun;help;run;tauri;android;build' {
            break
        }
        'bun;help;run;tauri;android;android-studio-script' {
            break
        }
        'bun;help;run;tauri;migrate' {
            break
        }
        'bun;help;run;tauri;info' {
            break
        }
        'bun;help;run;tauri;add' {
            break
        }
        'bun;help;run;tauri;remove' {
            break
        }
        'bun;help;run;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'bun;help;run;tauri;plugin;new' {
            break
        }
        'bun;help;run;tauri;plugin;init' {
            break
        }
        'bun;help;run;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'bun;help;run;tauri;plugin;android;init' {
            break
        }
        'bun;help;run;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'bun;help;run;tauri;plugin;ios;init' {
            break
        }
        'bun;help;run;tauri;icon' {
            break
        }
        'bun;help;run;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'bun;help;run;tauri;signer;sign' {
            break
        }
        'bun;help;run;tauri;signer;generate' {
            break
        }
        'bun;help;run;tauri;completions' {
            break
        }
        'bun;help;run;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'bun;help;run;tauri;permission;new' {
            break
        }
        'bun;help;run;tauri;permission;add' {
            break
        }
        'bun;help;run;tauri;permission;rm' {
            break
        }
        'bun;help;run;tauri;permission;ls' {
            break
        }
        'bun;help;run;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'bun;help;run;tauri;capability;new' {
            break
        }
        'bun;help;run;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'bun;help;run;tauri;inspect;wix-upgrade-code' {
            break
        }
        'bun;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}





Register-ArgumentCompleter -Native -CommandName 'deno' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'deno'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'deno' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('task', 'task', [CompletionResultType]::ParameterValue, 'task')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('-A', '-A ', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('--app-name', '--app-name', [CompletionResultType]::ParameterName, 'Name of your Tauri application')
            [CompletionResult]::new('-W', '-W ', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('--window-title', '--window-title', [CompletionResultType]::ParameterName, 'Window title of your Tauri application')
            [CompletionResult]::new('-D', '-D ', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('--frontend-dist', '--frontend-dist', [CompletionResultType]::ParameterName, 'Web assets location, relative to <project-dir>/src-tauri')
            [CompletionResult]::new('-P', '-P ', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--dev-url', '--dev-url', [CompletionResultType]::ParameterName, 'Url of your dev server')
            [CompletionResult]::new('--before-dev-command', '--before-dev-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri dev` kicks in')
            [CompletionResult]::new('--before-build-command', '--before-build-command', [CompletionResultType]::ParameterName, 'A shell command to run before `tauri build` kicks in')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force init to overwrite the src-tauri folder')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('--log', '--log', [CompletionResultType]::ParameterName, 'Enables logging')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;dev' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to run the application')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;build' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('--runner', '--runner', [CompletionResultType]::ParameterName, 'Binary to use to build the application, defaults to `cargo`')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features to activate')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--no-bundle', '--no-bundle', [CompletionResultType]::ParameterName, 'Skip the bundling step even if `bundle > active` is `true` in tauri config')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;bundle' {
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('--bundles', '--bundles', [CompletionResultType]::ParameterName, 'Space or comma separated list of bundles to package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'Space or comma separated list of features, should be the same features passed to `tauri build` if any')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Target triple to build against')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;android;init' {
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('--skip-targets-install', '--skip-targets-install', [CompletionResultType]::ParameterName, 'Skips installing rust toolchains via rustup')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;android;dev' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'Use the public network address for the development server. If an actual address it provided, it is used instead of prompting to pick one')
            [CompletionResult]::new('--port', '--port', [CompletionResultType]::ParameterName, 'Specify port for the built-in dev server for static files. Defaults to 1430')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--exit-on-panic', '--exit-on-panic', [CompletionResultType]::ParameterName, 'Exit on panic')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Run the code in release mode')
            [CompletionResult]::new('--no-dev-server-wait', '--no-dev-server-wait', [CompletionResultType]::ParameterName, 'Skip waiting for the frontend dev server to start before building the tauri application')
            [CompletionResult]::new('--no-watch', '--no-watch', [CompletionResultType]::ParameterName, 'Disable the file watcher')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio instead of trying to run on a connected device')
            [CompletionResult]::new('--force-ip-prompt', '--force-ip-prompt', [CompletionResultType]::ParameterName, 'Force prompting for an IP to use to connect to the dev server on mobile')
            [CompletionResult]::new('--no-dev-server', '--no-dev-server', [CompletionResultType]::ParameterName, 'Disable the built-in dev server for static files')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;android;build' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Which targets to build (all by default)')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('--features', '--features', [CompletionResultType]::ParameterName, 'List of cargo features to activate')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'JSON string or path to JSON file to merge with tauri.conf.json')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Builds with the debug flag')
            [CompletionResult]::new('--split-per-abi', '--split-per-abi', [CompletionResultType]::ParameterName, 'Whether to split the APKs and AABs per ABIs')
            [CompletionResult]::new('--apk', '--apk', [CompletionResultType]::ParameterName, 'Build APKs')
            [CompletionResult]::new('--aab', '--aab', [CompletionResultType]::ParameterName, 'Build AABs')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--open', '--open', [CompletionResultType]::ParameterName, 'Open Android Studio')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;android;android-studio-script' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('--target', '--target', [CompletionResultType]::ParameterName, 'Targets to build')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('--release', '--release', [CompletionResultType]::ParameterName, 'Builds with the release flag')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;android;help;init' {
            break
        }
        'deno;task;tauri;android;help;dev' {
            break
        }
        'deno;task;tauri;android;help;build' {
            break
        }
        'deno;task;tauri;android;help;android-studio-script' {
            break
        }
        'deno;task;tauri;android;help;help' {
            break
        }
        'deno;task;tauri;migrate' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;info' {
            [CompletionResult]::new('--interactive', '--interactive', [CompletionResultType]::ParameterName, 'Interactive mode to apply automatic fixes')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;add' {
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'Git tag to use')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'Git rev to use')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'Git branch to use')
            [CompletionResult]::new('--no-fmt', '--no-fmt', [CompletionResultType]::ParameterName, 'Don''t format code with rustfmt')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;remove' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;plugin' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;new' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;plugin;init' {
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('--directory', '--directory', [CompletionResultType]::ParameterName, 'Set target directory for init')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--author', '--author', [CompletionResultType]::ParameterName, 'Author name')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--tauri-path', '--tauri-path', [CompletionResultType]::ParameterName, 'Path of the Tauri project to use (relative to the cwd)')
            [CompletionResult]::new('--no-api', '--no-api', [CompletionResultType]::ParameterName, 'Initializes a Tauri plugin without the TypeScript API')
            [CompletionResult]::new('--no-example', '--no-example', [CompletionResultType]::ParameterName, 'Initialize without an example project')
            [CompletionResult]::new('--android', '--android', [CompletionResultType]::ParameterName, 'Whether to initialize an Android project for the plugin')
            [CompletionResult]::new('--ios', '--ios', [CompletionResultType]::ParameterName, 'Whether to initialize an iOS project for the plugin')
            [CompletionResult]::new('--mobile', '--mobile', [CompletionResultType]::ParameterName, 'Whether to initialize Android and iOS projects for the plugin')
            [CompletionResult]::new('--github-workflows', '--github-workflows', [CompletionResultType]::ParameterName, 'Generate github workflows')
            [CompletionResult]::new('--tauri', '--tauri', [CompletionResultType]::ParameterName, 'Initializes a Tauri core plugin (internal usage)')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;plugin;android' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;android;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;plugin;android;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;android;help;init' {
            break
        }
        'deno;task;tauri;plugin;android;help;help' {
            break
        }
        'deno;task;tauri;plugin;ios' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;ios;init' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--out-dir', '--out-dir', [CompletionResultType]::ParameterName, 'The output directory')
            [CompletionResult]::new('--ios-framework', '--ios-framework', [CompletionResultType]::ParameterName, 'Type of framework to use for the iOS project')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;plugin;ios;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;ios;help;init' {
            break
        }
        'deno;task;tauri;plugin;ios;help;help' {
            break
        }
        'deno;task;tauri;plugin;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;plugin;help;new' {
            break
        }
        'deno;task;tauri;plugin;help;init' {
            break
        }
        'deno;task;tauri;plugin;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'deno;task;tauri;plugin;help;android;init' {
            break
        }
        'deno;task;tauri;plugin;help;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'deno;task;tauri;plugin;help;ios;init' {
            break
        }
        'deno;task;tauri;plugin;help;help' {
            break
        }
        'deno;task;tauri;icon' {
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output directory. Default: ''icons'' directory next to the tauri.conf.json file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--png', '--png', [CompletionResultType]::ParameterName, 'Custom PNG icon sizes to generate. When set, the default icons are not generated')
            [CompletionResult]::new('--ios-color', '--ios-color', [CompletionResultType]::ParameterName, 'The background color of the iOS icon - string as defined in the W3C''s CSS Color Module Level 4 <https://www.w3.org/TR/css-color-4/>')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;signer' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;signer;sign' {
            [CompletionResult]::new('-k', '-k', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('--private-key', '--private-key', [CompletionResultType]::ParameterName, 'Load the private key from a string')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('--private-key-path', '--private-key-path', [CompletionResultType]::ParameterName, 'Load the private key from a file')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;signer;generate' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'Set private key password when signing')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('--write-keys', '--write-keys', [CompletionResultType]::ParameterName, 'Write private key to a file')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Overwrite private key even if it exists on the specified path')
            [CompletionResult]::new('--ci', '--ci', [CompletionResultType]::ParameterName, 'Skip prompting for values')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;signer;help' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;signer;help;sign' {
            break
        }
        'deno;task;tauri;signer;help;generate' {
            break
        }
        'deno;task;tauri;signer;help;help' {
            break
        }
        'deno;task;tauri;completions' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Shell to generate a completion script for.')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'Output file for the shell completions. By default the completions are printed to stdout')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;permission' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;permission;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Permission description')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('--allow', '--allow', [CompletionResultType]::ParameterName, 'List of commands to allow')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--deny', '--deny', [CompletionResultType]::ParameterName, 'List of commands to deny')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;permission;add' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;permission;rm' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help (see more with ''--help'')')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;permission;ls' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('--filter', '--filter', [CompletionResultType]::ParameterName, 'Permission identifier filter')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;permission;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;permission;help;new' {
            break
        }
        'deno;task;tauri;permission;help;add' {
            break
        }
        'deno;task;tauri;permission;help;rm' {
            break
        }
        'deno;task;tauri;permission;help;ls' {
            break
        }
        'deno;task;tauri;permission;help;help' {
            break
        }
        'deno;task;tauri;capability' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;capability;new' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'Capability description')
            [CompletionResult]::new('--windows', '--windows', [CompletionResultType]::ParameterName, 'Capability windows')
            [CompletionResult]::new('--permission', '--permission', [CompletionResultType]::ParameterName, 'Capability permissions')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Output file format')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('--out', '--out', [CompletionResultType]::ParameterName, 'The output file')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;capability;help' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;capability;help;new' {
            break
        }
        'deno;task;tauri;capability;help;help' {
            break
        }
        'deno;task;tauri;inspect' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;inspect;wix-upgrade-code' {
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Enables verbose logging')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
        'deno;task;tauri;inspect;help' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;inspect;help;wix-upgrade-code' {
            break
        }
        'deno;task;tauri;inspect;help;help' {
            break
        }
        'deno;task;tauri;help' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;tauri;help;init' {
            break
        }
        'deno;task;tauri;help;dev' {
            break
        }
        'deno;task;tauri;help;build' {
            break
        }
        'deno;task;tauri;help;bundle' {
            break
        }
        'deno;task;tauri;help;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'deno;task;tauri;help;android;init' {
            break
        }
        'deno;task;tauri;help;android;dev' {
            break
        }
        'deno;task;tauri;help;android;build' {
            break
        }
        'deno;task;tauri;help;android;android-studio-script' {
            break
        }
        'deno;task;tauri;help;migrate' {
            break
        }
        'deno;task;tauri;help;info' {
            break
        }
        'deno;task;tauri;help;add' {
            break
        }
        'deno;task;tauri;help;remove' {
            break
        }
        'deno;task;tauri;help;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'deno;task;tauri;help;plugin;new' {
            break
        }
        'deno;task;tauri;help;plugin;init' {
            break
        }
        'deno;task;tauri;help;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'deno;task;tauri;help;plugin;android;init' {
            break
        }
        'deno;task;tauri;help;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'deno;task;tauri;help;plugin;ios;init' {
            break
        }
        'deno;task;tauri;help;icon' {
            break
        }
        'deno;task;tauri;help;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'deno;task;tauri;help;signer;sign' {
            break
        }
        'deno;task;tauri;help;signer;generate' {
            break
        }
        'deno;task;tauri;help;completions' {
            break
        }
        'deno;task;tauri;help;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'deno;task;tauri;help;permission;new' {
            break
        }
        'deno;task;tauri;help;permission;add' {
            break
        }
        'deno;task;tauri;help;permission;rm' {
            break
        }
        'deno;task;tauri;help;permission;ls' {
            break
        }
        'deno;task;tauri;help;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'deno;task;tauri;help;capability;new' {
            break
        }
        'deno;task;tauri;help;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'deno;task;tauri;help;inspect;wix-upgrade-code' {
            break
        }
        'deno;task;tauri;help;help' {
            break
        }
        'deno;task;help' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;task;help;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'deno;task;help;tauri;init' {
            break
        }
        'deno;task;help;tauri;dev' {
            break
        }
        'deno;task;help;tauri;build' {
            break
        }
        'deno;task;help;tauri;bundle' {
            break
        }
        'deno;task;help;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'deno;task;help;tauri;android;init' {
            break
        }
        'deno;task;help;tauri;android;dev' {
            break
        }
        'deno;task;help;tauri;android;build' {
            break
        }
        'deno;task;help;tauri;android;android-studio-script' {
            break
        }
        'deno;task;help;tauri;migrate' {
            break
        }
        'deno;task;help;tauri;info' {
            break
        }
        'deno;task;help;tauri;add' {
            break
        }
        'deno;task;help;tauri;remove' {
            break
        }
        'deno;task;help;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'deno;task;help;tauri;plugin;new' {
            break
        }
        'deno;task;help;tauri;plugin;init' {
            break
        }
        'deno;task;help;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'deno;task;help;tauri;plugin;android;init' {
            break
        }
        'deno;task;help;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'deno;task;help;tauri;plugin;ios;init' {
            break
        }
        'deno;task;help;tauri;icon' {
            break
        }
        'deno;task;help;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'deno;task;help;tauri;signer;sign' {
            break
        }
        'deno;task;help;tauri;signer;generate' {
            break
        }
        'deno;task;help;tauri;completions' {
            break
        }
        'deno;task;help;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'deno;task;help;tauri;permission;new' {
            break
        }
        'deno;task;help;tauri;permission;add' {
            break
        }
        'deno;task;help;tauri;permission;rm' {
            break
        }
        'deno;task;help;tauri;permission;ls' {
            break
        }
        'deno;task;help;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'deno;task;help;tauri;capability;new' {
            break
        }
        'deno;task;help;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'deno;task;help;tauri;inspect;wix-upgrade-code' {
            break
        }
        'deno;task;help;help' {
            break
        }
        'deno;help' {
            [CompletionResult]::new('task', 'task', [CompletionResultType]::ParameterValue, 'task')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'deno;help;task' {
            [CompletionResult]::new('tauri', 'tauri', [CompletionResultType]::ParameterValue, 'Command line interface for building Tauri apps')
            break
        }
        'deno;help;task;tauri' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri project in an existing directory')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode and generate bundles and installers')
            [CompletionResult]::new('bundle', 'bundle', [CompletionResultType]::ParameterValue, 'Generate bundles and installers for your app (already built by `tauri build`)')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Android commands')
            [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterValue, 'Migrate from v1 to v2')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Show a concise list of information about the environment, Rust, Node.js and their versions as well as a few relevant project configurations')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a tauri plugin to the project')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a tauri plugin from the project')
            [CompletionResult]::new('plugin', 'plugin', [CompletionResultType]::ParameterValue, 'Manage or create Tauri plugins')
            [CompletionResult]::new('icon', 'icon', [CompletionResultType]::ParameterValue, 'Generate various icons for all major platforms')
            [CompletionResult]::new('signer', 'signer', [CompletionResultType]::ParameterValue, 'Generate signing keys for Tauri updater or sign files')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'Generate Tauri CLI shell completions for Bash, Zsh, PowerShell or Fish')
            [CompletionResult]::new('permission', 'permission', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            [CompletionResult]::new('capability', 'capability', [CompletionResultType]::ParameterValue, 'Manage or create capabilities for your app')
            [CompletionResult]::new('inspect', 'inspect', [CompletionResultType]::ParameterValue, 'Manage or create permissions for your app or plugin')
            break
        }
        'deno;help;task;tauri;init' {
            break
        }
        'deno;help;task;tauri;dev' {
            break
        }
        'deno;help;task;tauri;build' {
            break
        }
        'deno;help;task;tauri;bundle' {
            break
        }
        'deno;help;task;tauri;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize Android target in the project')
            [CompletionResult]::new('dev', 'dev', [CompletionResultType]::ParameterValue, 'Run your app in development mode on Android')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Build your app in release mode for Android and generate APKs and AABs')
            [CompletionResult]::new('android-studio-script', 'android-studio-script', [CompletionResultType]::ParameterValue, 'android-studio-script')
            break
        }
        'deno;help;task;tauri;android;init' {
            break
        }
        'deno;help;task;tauri;android;dev' {
            break
        }
        'deno;help;task;tauri;android;build' {
            break
        }
        'deno;help;task;tauri;android;android-studio-script' {
            break
        }
        'deno;help;task;tauri;migrate' {
            break
        }
        'deno;help;task;tauri;info' {
            break
        }
        'deno;help;task;tauri;add' {
            break
        }
        'deno;help;task;tauri;remove' {
            break
        }
        'deno;help;task;tauri;plugin' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Initializes a new Tauri plugin project')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initialize a Tauri plugin project on an existing directory')
            [CompletionResult]::new('android', 'android', [CompletionResultType]::ParameterValue, 'Manage the Android project for a Tauri plugin')
            [CompletionResult]::new('ios', 'ios', [CompletionResultType]::ParameterValue, 'Manage the iOS project for a Tauri plugin')
            break
        }
        'deno;help;task;tauri;plugin;new' {
            break
        }
        'deno;help;task;tauri;plugin;init' {
            break
        }
        'deno;help;task;tauri;plugin;android' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the Android project for an existing Tauri plugin')
            break
        }
        'deno;help;task;tauri;plugin;android;init' {
            break
        }
        'deno;help;task;tauri;plugin;ios' {
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Initializes the iOS project for an existing Tauri plugin')
            break
        }
        'deno;help;task;tauri;plugin;ios;init' {
            break
        }
        'deno;help;task;tauri;icon' {
            break
        }
        'deno;help;task;tauri;signer' {
            [CompletionResult]::new('sign', 'sign', [CompletionResultType]::ParameterValue, 'Sign a file')
            [CompletionResult]::new('generate', 'generate', [CompletionResultType]::ParameterValue, 'Generate a new signing key to sign files')
            break
        }
        'deno;help;task;tauri;signer;sign' {
            break
        }
        'deno;help;task;tauri;signer;generate' {
            break
        }
        'deno;help;task;tauri;completions' {
            break
        }
        'deno;help;task;tauri;permission' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a permission to capabilities')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a permission file, and its reference from any capability')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List permissions available to your application')
            break
        }
        'deno;help;task;tauri;permission;new' {
            break
        }
        'deno;help;task;tauri;permission;add' {
            break
        }
        'deno;help;task;tauri;permission;rm' {
            break
        }
        'deno;help;task;tauri;permission;ls' {
            break
        }
        'deno;help;task;tauri;capability' {
            [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterValue, 'Create a new permission file')
            break
        }
        'deno;help;task;tauri;capability;new' {
            break
        }
        'deno;help;task;tauri;inspect' {
            [CompletionResult]::new('wix-upgrade-code', 'wix-upgrade-code', [CompletionResultType]::ParameterValue, 'Print the default Upgrade Code used by MSI installer derived from productName')
            break
        }
        'deno;help;task;tauri;inspect;wix-upgrade-code' {
            break
        }
        'deno;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}

