<#
    Strings

    Strings in PowerShell come in two flavours: standard strings, and string literals.
    Standard strings in PoSH are created using double-quotes, whereas string literals
    are created with single quotes.

    Unlike most other languages, standard strings in PowerShell are not literal and
    can evaluate expressions or variables mid-string in order to dynamically insert
    values into a preset string.
#>
Describe 'Strings' {

    It 'is a simple string of text' {
        'string' | Should -Be __
    }

    Context 'Literal Strings' {

        It 'assumes everything is literal' {
            $var = 'Some things you must take literally'
            $var | Should -Be __
        }
        It 'can contain special characters' {
            $complexVar = 'They have $ or : or ; or _'
            $complexVar | Should be '__'
        }

    }
    Context 'Expandable Strings' {

        It 'can expand variables' {
            $var = 'apple'
            "My favorite fruit is $var" | Should -Be __
        }

        It 'can do a simple expansion' {
            $Windows = Get-Item 'C:\Windows' | Select-Object -ExpandProperty FullName
            "The windows directory is located here: $Windows" | Should -Be __
        }

        It 'handles other ways of doing the same thing' {

            "The windows directory is located $(Get-ChildItem 'C:\Windows' | Select-Object -ExpandProperty FullName)" |
                Should -Be __
        }
    }

    Context 'String Concatenation' {

        It 'adds strings together' {
            $String1 = 'This string'
            $String2 = 'is cool.'

            $String1 + ' ' + $String2 | Should -Be 'This string is cool.'
        }
        It 'can be done simpler' {
            $String1 = 'This string'
            $String2 = 'is cool.'

            "$String1 __" | Should -Be 'This string is cool'
        }
    }
}
