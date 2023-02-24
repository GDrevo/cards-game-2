class Card < ApplicationRecord
  belongs_to :player
  has_many :skills
  has_many :battle_cards

  after_create :create_skills

  private

  def create_skills
    best_cards = ["King", "Archfiend"]
    good_cards = ["Paladin", "Crusader", "Cleric", "Captain", "Demon", "Necromancer", "Warlock", "Hellhound"]

    if best_cards.include?(name)
      Skill.create(name: "Strong Attack", target_type: "Single", strength: "Strong", reload_time: 1, card: self)
      Skill.create(name: "Multi Attack", target_type: "Multi", strength: "Normal", reload_time: 2, card: self)
      Skill.create(name: "Special Attack", target_type: "Multi", strength: "Strong", reload_time: 3, card: self)
    elsif good_cards.include?(name)
      case card_type
      when "attacker"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Normal", reload_time: 1, card: self)
        Skill.create(name: "Multi Attack", target_type: "Multi", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Special Attack", target_type: "Single", strength: "Strong", reload_time: 3, card: self)
      when "healer"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Strong Heal", target_type: "Single", strength: "Strong", reload_time: 2, card: self)
        Skill.create(name: "Multi Heal", target_type: "Multi", strength: "Normal", reload_time: 3, card: self)
      end
    else
      case card_type
      when "attacker"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Stronger Attack", target_type: "Single", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Special Attack", target_type: "Single", strength: "Normal", reload_time: 3, card: self)
      when "healer"
        Skill.create(name: "Basic Attack", target_type: "Single", strength: "Light", reload_time: 1, card: self)
        Skill.create(name: "Basic Heal", target_type: "Single", strength: "Normal", reload_time: 2, card: self)
        Skill.create(name: "Multi Heal", target_type: "Multi", strength: "Light", reload_time: 3, card: self)
      end
    end
  end
end
