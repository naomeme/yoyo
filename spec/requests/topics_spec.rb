# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Topics" do

  subject { page }

  describe '新しいトピック投稿' do
    before { visit root_path  }

    context '正しい値を入力' do
      before do
        fill_in 'topic_subject', with: 'Example Subject'
        fill_in 'topic_name',    with: 'Example Name'
        fill_in 'topic_body',    with: 'Example Body'
      end

      it 'トピックが作成される' do
        expect {
          click_button 'Create Topic'
          should have_content 'Topic was successfully created.'
        }.to change(
          Topic, :count
        ).by(1)
      end
    end
  end

end
