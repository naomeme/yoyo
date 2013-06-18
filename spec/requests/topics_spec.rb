# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Topics" do

  subject { page }

  describe '新しいトピック投稿' do
    before { visit root_path  }

    context 'when valid' do
      before do
        fill_in 'topic_subject', with: 'Example Subject'
        fill_in 'topic_name',    with: 'Example Name'
        fill_in 'topic_body',    with: 'Example Body'
      end

      it 'トピックが作成される' do
        expect {
          click_button 'Create Topic'
          should have_content 'Topic was successfully created.'
        }.to change(Topic, :count).by(1)
      end

      context 'when invalid' do
        context 'subject が入力されていないとき' do
          before do
            fill_in 'topic_subject', with: ''
            fill_in 'topic_name',    with: 'Example Name'
            fill_in 'topic_body',    with: 'Example Body'
          end

          it 'error が表示される' do
            expect {
              click_button 'Create Topic'
              should have_content 'error'
              should have_content "Subject can't be blank"
            }.not_to change(Topic, :count)
          end
        end

        context 'name が入力されていないとき' do
          before do
            fill_in 'topic_subject', with: 'Example Subject'
            fill_in 'topic_name',    with: ''
            fill_in 'topic_body',    with: 'Example Body'
          end

          it 'error が表示される' do
            expect {
              click_button 'Create Topic'
              should have_content 'error'
              should have_content "Name can't be blank"
            }.not_to change(Topic, :count)
          end
        end

        context 'body が入力されていないとき' do
          before do
            fill_in 'topic_subject', with: 'Example Subject'
            fill_in 'topic_name',    with: 'Example Name'
            fill_in 'topic_body',    with: ''
          end

          it 'error が表示される' do
            expect {
              click_button 'Create Topic'
              should have_content 'error'
              should have_content "Body can't be blank"
            }.not_to change(Topic, :count)
          end
        end
      end
    end
  end

  describe 'トピック一覧' do
    let!(:topic) { create :topic }
    before { visit root_path }

    it { should have_content topic.subject }
  end

  describe '個別トピックページ' do
    let(:topic) { create :topic }
    before { visit topic_path topic }

    it { should have_content topic.subject }
    it { should have_link 'Edit', href: edit_topic_path(topic) }
    it { should have_link 'Delete' }
    it { should have_link 'Back', href: root_path }
  end

  describe 'トピック編集' do
    let(:topic) { create :topic }
    before { visit edit_topic_path topic }

    context 'when valid' do
      before do
        fill_in 'topic_subject', with: 'New Subject'
        fill_in 'topic_name',    with: 'New Name'
        fill_in 'topic_body',    with: 'New Body'
        click_button 'Update Topic'
      end

      it { should have_content 'New Subject' }
      it { should have_content 'New Name' }
      it { should have_content 'New Body' }
      specify { expect(topic.reload.subject).to eq 'New Subject' }
      specify { expect(topic.reload.name).to eq    'New Name' }
      specify { expect(topic.reload.body).to eq    'New Body' }
    end
  end

  describe 'トピック削除' do
    let(:topic) { create :topic }
    before { visit topic_path topic }

    it 'Delete をクリックしたら削除される' do
      expect { click_link 'Delete' }.to change(Topic, :count).by(-1)
    end
  end

end
