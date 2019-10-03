require "spec/api_stub"
require "main"
require "data"

local NFB = NeedsFoodBadly

describe("#usable", function ()
    describe("Should identify usable #food", function ()
        setup(function ()
            _G.UnitLevel = function () return 35 end
        end)
        it("Spotted Yellowtail is usable food", function ()
            assert.is_true(NFB:IsUsableFood(NFB.Food[6887]))
        end)
        it("level too low for Alterac Swiss", function ()
            assert.is_false(NFB:IsUsableFood(NFB.Food[8932]))
        end)
        it("Spider Sausage buffs stam/spid", function ()
            assert.is_false(NFB:IsUsableFood(NFB.Food[17222]))
        end)
        it("Moonberry Juice is a drink", function ()
            assert.is_false(NFB:IsUsableFood(NFB.Food[1645]))
        end)
        it("Sagefish Delight is a mana buff", function ()
            assert.is_false(NFB:IsUsableFood(NFB.Food[21217]))
        end)
        it("Green Tea Leaf is food and drink", function ()
            assert.is_true(NFB:IsUsableFood(NFB.Food[1401]))
        end)
    end)
    describe("Should identify usable stam/spi #bufffood", function ()
        setup(function ()
            _G.UnitLevel = function () return 35 end
        end)
        it("Spider Sausage is usable buff food", function ()
            assert.is_true(NFB:IsUsableBuffFood(NFB.Food[17222]))
        end)
        it("level too low for Clamlette Surprise", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[16971]))
        end)
        it("Grilled Squid buffs agi", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[13928]))
        end)
        it("Spotted Yellowtail is not buff food", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[6887]))
        end)
        it("Moonberry Juice is a drink", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[1645]))
        end)
        it("Sagefish Delight is a mana buff", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[21217]))
        end)
    end)
    describe("Should identify usable #drink", function ()
        setup(function ()
            _G.UnitLevel = function () return 35 end
        end)
        it("Moonberry Juice is a usable drink", function ()
            assert.is_true(NFB:IsUsableDrink(NFB.Food[1645]))
        end)
        it("level too low for Hyjal Nectar", function ()
            assert.is_false(NFB:IsUsableDrink(NFB.Food[18300]))
        end)
        it("Spotted Yellowtail is food", function ()
            assert.is_false(NFB:IsUsableDrink(NFB.Food[6887]))
        end)
        it("Spider Sausage is buff food", function ()
            assert.is_false(NFB:IsUsableDrink(NFB.Food[17222]))
        end)
        it("Sagefish Delight is a mana buff", function ()
            assert.is_false(NFB:IsUsableDrink(NFB.Food[21217]))
        end)
        it("Green Tea Leaf is food and drink", function ()
            assert.is_true(NFB:IsUsableDrink(NFB.Food[1401]))
        end)
    end)
    describe("Should identify usable mp5 #buffdrink:", function ()
        setup(function ()
            _G.UnitLevel = function () return 32 end
        end)
        it("Sagefish Delight is usable mp5 buff food/drink", function ()
            assert.is_true(NFB:IsUsableBuffDrink(NFB.Food[21217]))
        end)
        it("level too low for Nightfin Soup", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[13931]))
        end)
        it("Sweet Nectar is not mp5 buff food/drink", function ()
            assert.is_false(NFB:IsUsableBuffFood(NFB.Food[1708]))
        end)
    end)
    describe("Should identify usable #hpotion", function ()
        setup(function ()
            _G.UnitLevel = function () return 36 end
        end)
        it("Greater Healing Potion is a usable health potion", function ()
            assert.is_true(NFB:IsUsableHPotion(NFB.Potion[1710]))
        end)
        it("level too low for Major Healing Potion", function ()
            assert.is_false(NFB:IsUsableHPotion(NFB.Potion[13446]))
        end)
        it("Greater Mana Potion is not a health potion", function ()
            assert.is_false(NFB:IsUsableHPotion(NFB.Potion[6149]))
        end)
        it("Major Healing Draft only usable in battlegrounds", function ()
            assert.is_false(NFB:IsUsableHPotion(NFB.Potion[17348]))
        end)
    end)
    describe("Should identify usable #mpotion", function ()
        setup(function ()
            _G.UnitLevel = function () return 45 end
        end)
        it("Greater Mana Potion is a usable mana potion", function ()
            assert.is_true(NFB:IsUsableMPotion(NFB.Potion[6149]))
        end)
        it("level too low for Major Mana Potion", function ()
            assert.is_false(NFB:IsUsableMPotion(NFB.Potion[13444]))
        end)
        it("Greater Healing Potion is not a health potion", function ()
            assert.is_false(NFB:IsUsableMPotion(NFB.Potion[1710]))
        end)
        it("Major Mana Draft only usable in battlegrounds", function ()
            assert.is_false(NFB:IsUsableMPotion(NFB.Potion[17351]))
        end)
    end)
    describe("Should identify usable #healthstone", function ()
        setup(function ()
            _G.UnitLevel = function () return 34 end
        end)
        it("Healthstone is a usable healthstone", function ()
            assert.is_true(NFB:IsUsableHealthstone(NFB.Healthstone[19008]))
        end)
        it("level too low for Greater Healthstone", function ()
            assert.is_false(NFB:IsUsableHealthstone(NFB.Healthstone[19010]))
        end)
    end)
    describe("Should identify usable #managem", function ()
        setup(function ()
            _G.UnitLevel = function () return 38 end
        end)
        it("Mana Jade is a usable mana gem", function ()
            assert.is_true(NFB:IsUsableManaGem(NFB.ManaGem[5513]))
        end)
        it("level too low for Mana Citrine", function ()
            assert.is_false(NFB:IsUsableManaGem(NFB.ManaGem[8007]))
        end)
    end)
    describe("Should identify usable #bandage", function ()
        setup(function ()
            _G.PROFESSIONS_FIRST_AID = "First Aid"
            _G.GetNumSkillLines = function () return 1 end
            _G.GetSkillLineInfo = function () return _G.PROFESSIONS_FIRST_AID, nil, nil, 125, 0, 0 end
        end)
        it("Heavy Silk Bandage is a usable bandage", function ()
            assert.is_true(NFB:IsUsableBandage(NFB.Bandage[6451]))
        end)
        it("skill too low for Runecloth Bandage", function ()
            assert.is_false(NFB:IsUsableBandage(NFB.Bandage[14529]))
        end)
        it("Warsong Gulch Sik Bandage only usable in Warsong Gulch", function ()
            assert.is_false(NFB:IsUsableBandage(NFB.Bandage[19068]))
        end)
    end)
end)
describe("#better", function ()
    describe("Should rank #food", function ()
        setup(function ()
            _G.UnitHealthMax = function () return 10000 end
            _G.GetItemCount = function (id)
                if     id == 4593 then return 23
                elseif id == 1114 then return 40
                else return 7 end
            end
        end)
        it("better healing is preferred", function ()
            assert.is_true(NFB.BetterFood(NFB.Food[6887], NFB.Food[4593]))
        end)
        it("percent food is respected", function ()
            assert.is_true(NFB.BetterFood(NFB.Food[21240], NFB.Food[4536]))
            assert.is_false(NFB.BetterFood(NFB.Food[21240], NFB.Food[12238]))
        end)
        it("conjured is preferred, even with lower healing", function ()
            assert.is_true(NFB.BetterFood(NFB.Food[22895], NFB.Food[3770]))
        end)
        it("conjured is preferred, even with larger stack", function ()
            assert.is_true(NFB.BetterFood(NFB.Food[1114], NFB.Food[3770]))
        end)
        it("smaller stack is preferred", function ()
            assert.is_true(NFB.BetterFood(NFB.Food[3770], NFB.Food[4593]))
        end)
    end)
    describe("Should rank #bufffood", function ()
        setup(function ()
            _G.GetItemCount = function (id)
                if id == 6038 then return 20
                else return 7 end
            end
        end)
        it("better stam/spi is preferred", function ()
            assert.is_true(NFB.BetterBuffFood(NFB.Food[12211], NFB.Food[3662]))
        end)
        it("smaller stack is preferred", function ()
            assert.is_true(NFB.BetterBuffFood(NFB.Food[12211], NFB.Food[6038]))
        end)
    end)
    describe("Should rank #drink", function ()
        setup(function ()
            _G.UnitHealthMax = function () return 10000 end
            _G.GetItemCount = function (id)
                if     id == 1708 then return 23
                elseif id == 3772 then return 40
                else return 7 end
            end
        end)
        it("better mana is preferred", function ()
            assert.is_true(NFB.BetterDrink(NFB.Food[1645], NFB.Food[9451]))
        end)
        it("percent mana is respected", function ()
            assert.is_true(NFB.BetterDrink(NFB.Food[23172], NFB.Food[159]))
            assert.is_false(NFB.BetterDrink(NFB.Food[23172], NFB.Food[1179]))
        end)
        it("conjured is preferred, even with lower mana", function ()
            assert.is_true(NFB.BetterDrink(NFB.Food[5350], NFB.Food[1645]))
        end)
        it("conjured is preferred, even with larger stack", function ()
            assert.is_true(NFB.BetterDrink(NFB.Food[3772], NFB.Food[1708]))
        end)
        it("smaller stack is preferred", function ()
            assert.is_true(NFB.BetterDrink(NFB.Food[10841], NFB.Food[1708]))
        end)
    end)
    describe("Should rank #buffdrink", function ()
        it("better mp5 is preferred", function ()
            assert.is_true(NFB.BetterBuffDrink(NFB.Food[13931], NFB.Food[21217]))
        end)
    end)
    describe("Should rank #hpotion", function ()
        it("better healing is preferred", function ()
            assert.is_true(NFB.BetterHPotion(NFB.Potion[3928], NFB.Potion[1710]))
        end)
    end)
    describe("Should rank #mpotion", function ()
        it("better mana is preferred", function ()
            assert.is_true(NFB.BetterMPotion(NFB.Potion[13443], NFB.Potion[6149]))
        end)
    end)
    describe("Should rank #healthstone", function ()
        it("better health is preferred", function ()
            assert.is_true(NFB.BetterHealthstone(NFB.Healthstone[19011], NFB.Healthstone[19010]))
        end)
    end)
    describe("Should rank #managem", function ()
        it("better mana is preferred", function ()
            assert.is_true(NFB.BetterManaGem(NFB.ManaGem[8008], NFB.ManaGem[8007]))
        end)
    end)
    describe("Should rank #bandage", function ()
        it("better health is preferred", function ()
            assert.is_true(NFB.BetterBandage(NFB.Bandage[14529], NFB.Bandage[6451]))
        end)
        it("bg bandage is preferred", function ()
            assert.is_true(NFB.BetterBandage(NFB.Bandage[20243], NFB.Bandage[14530]))
        end)
    end)
end)