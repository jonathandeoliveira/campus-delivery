require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe '#valid?' do
    it 'Altura não pode ficar em branco' do
      #arrange
      budget = Budget.new(height:'', width:1, length:1, weight:1, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Largura não pode ficar em branco' do
      #arrange
      budget = Budget.new(height:1, width:'', length:1, weight:1, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Comprimento não pode ficar em branco' do
      #arrange
      budget = Budget.new(height:1, width:1, length:'', weight:1, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Peso não pode ficar em branco' do
      #arrange
      budget = Budget.new(height:'', width:1, length:1, weight:'', distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Distância não pode ficar em branco' do
      #arrange
      budget = Budget.new(height:'', width:1, length:1, weight:1, distance:'')
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Distância deve ser maior que 0' do
      #arrange
      budget = Budget.new(height:1, width:1, length:1, weight:1, distance:-0.9)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Peso deve ser maior que 0' do
      #arrange
      budget = Budget.new(height:1, width:1, length:1, weight:-0.9, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Comprimento deve ser maior que 0' do
      #arrange
      budget = Budget.new(height:1, width:1, length:-0.1, weight:0, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Largura deve ser maior que 0' do
      #arrange
      budget = Budget.new(height:1, width:-0.0001, length:1, weight:0, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end

    it 'Altura deve ser maior que 0' do
      #arrange
      budget = Budget.new(height:-0.00000000001, width:0, length:1, weight:0, distance:1)
      #act
      result = budget.valid?
      #assert
      expect(result).to eq false
    end
  end
end
