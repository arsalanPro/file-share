require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
    context 'file_size_verbose' do
        it 'should return 1 KB for 1111 bytes' do
          expect(@controller.helpers.file_size_verbose 1111).to eq('1 KB')
        end
        it 'should return 1 MB for 1111111 bytes' do
            expect(@controller.helpers.file_size_verbose 1111111).to eq('1 MB')
        end
        it 'should return 1 MB for 1111111111 bytes' do
            expect(@controller.helpers.file_size_verbose 1111111111).to eq('1 GB')
        end
    end
end