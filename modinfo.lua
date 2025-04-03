
name = "飘然工具箱"
description = "[饥友们一起玩]服务器系列mod"
author = "nipuru"
version = "1.5"

forumthread = ""

api_version = 6
api_version_dst = 10

dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false

priority = -999999
server_filter_tags = {}

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
        name = "crops_preserve",
        label = "作物成熟后不腐烂",
		hover = "开启后作物成熟后不腐烂",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "eyeturret_recover",
        label = "炮塔可解除部署",
		hover = "开启后作物炮塔可右键拆除部署",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "houndstooth_blowpipe_infinite",
        label = "嚎弹炮无限容量",
		hover = "开启后嚎弹炮无限装填弹药",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "beargerfur_sack_infinite",
        label = "熊罐无限容量",
		hover = "开启后熊罐无限堆叠食物",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "beargerfur_sack_preserver",
        label = "熊罐保鲜",
		hover = "开启后熊罐永久保鲜",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "seedpouch_preserver",
        label = "种子袋保鲜",
		hover = "开启后种子袋永久保鲜",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "cage_preserver",
        label = "鸟笼保鲜",
		hover = "开启后鸟笼永久保鲜",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "fridge_preserver",
        label = "冰箱保鲜",
		hover = "开启后冰箱冰切永久保鲜",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "icepack_preserver",
        label = "熊皮包保鲜",
		hover = "开启后冰箱冰切永久保鲜",
        options =
        {
            {description = "开启", data = 0},
            {description = "关闭", data = 0.5},
        },
        default = 0.5,
    },
    {
        name = "krampus_sack_preserver",
        label = "小偷背包保鲜",
		hover = "开启后小偷背包永久保鲜",
        options =
        {
            {description = "开启", data = 0},
            {description = "关闭", data = 1},
        },
        default = 1,
    },
    {
        name = "saltbox_preserver",
        label = "盐箱保鲜",
		hover = "开启后盐箱永久保鲜",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},
        },
        default = false,
    },
    {
        name = "cook_rate",
        label = "烹饪提速",
		hover = "提升烹饪速度",
        options =
        {
            {description = "默认", data = 1},
            {description = "二倍速", data = 0.5},
            {description = "四倍速", data = 0.25},
            {description = "立即完成", data = 0},
        },
        default = 1,
    }
}
