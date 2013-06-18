# -*- coding: utf-8 -*-
require 'spec_helper'

describe Topic do

  describe 'order' do
    let!(:topic1) { create(:topic) }
    let!(:topic2) { create(:topic) }

    it '新しい順に取得できる' do
      Topic.all.first.should eq topic2
      Topic.all.last.should eq topic1
    end
  end
end
