# -*- coding: utf-8 -*-
require 'rubygems'
require 'rspec'
require_relative 'stack'
require_relative 'custom_stack_matchers'

RSpec.configure do |config|
  config.include CustomStackMatchers # (5) カスタムマッチャを使えるようにする
end

describe Stack do
  context '新規作成の場合' do
    before { @stack = Stack.new }

    subject { @stack }
    its(:empty?) { should be_true }
  end

  context '空の場合' do
    before { @stack = Stack.new }

    describe '#size' do
      subject { @stack.size }
      it { should == 0 }
    end

    describe '#pop' do
      subject { lambda { @stack.pop } }
      it { should raise_error(Stack::EmptyError) }
    end

    describe '#push' do
      subject { lambda { @stack.push(Object.new) } }
      it { should change(@stack, :size).by(1) }
    end
  end

  context 'オブジェクトをpushした場合' do
    before { @stack = Stack.new }

    subject { @stack }
    it { should pop_latest_pushed_value(Object.new) }
  end
end