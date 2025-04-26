-- this is not necessory at all
return {
    "goolord/alpha-nvim",
    dependencies ={
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.startify")

        dashboard.section.header.val = {
[[  _____________________                              _____________________    ]],
[[  `-._:  .:'   `:::  .:\           |\__/|           /::  .:'   `:::  .:.-'    ]],
[[      \      :          \          |:   |          /         :       /        ]],
[[       \     ::    .     `-_______/ ::   \_______-'   .      ::   . /         ]],
[[        |  :   :: ::'  :   :: ::'  :   :: ::'      :: ::'  :   :: :|          ]],
[[        |     ;::         ;::         ;::         ;::         ;::  |          ]],
[[        |  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:|          ]],
[[        /     :           :           :           :           :    \          ]],
[[       /______::_____     ::    .     ::    .     ::   _____._::____\         ]],
[[                     `----._:: ::'  :   :: ::'  _.----'                       ]],
[[                            `--.       ;::  .--'                              ]],
[[                                `-. .:'  .-'                                  ]],
[[                                   \    /                                     ]],
[[                                    \  /                                      ]],
[[                                     \/                                       ]],
        }
        alpha.setup(dashboard.opts)
    end,
}
