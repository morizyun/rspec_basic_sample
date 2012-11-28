# -*- coding: utf-8 -*-
require 'rubygems'
require 'rspec'

describe 'Level 1' do
  before(:all)  { puts 'L1 - before all'      }
  before(:each) { puts 'L1 - before each' }
  after(:all)   { puts 'L1 - after all'       }
  after(:each)  { puts 'L1 - after each'  }

  it('body-1.1') { puts 'body-1.1' }

  describe 'Level 2' do
    before(:all)  { puts 'L2 - before all'      }
    before(:each) { puts 'L2 - before each' }
    after(:all)   { puts 'L2 - after all'       }
    after(:each)  { puts 'L2 - after each'  }

    it('body-2.1') { puts 'body-2.1'}
    it('body-2.2') { puts 'body-2.2'}
  end

  it('body-1.2') { puts 'body-1.2' }
end