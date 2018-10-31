class Admin::NotesController < ApplicationController
  before_action :set_note, only: [:update, :destroy]
  def index
    @notes = Note.all
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to admin_notes_path, notice: "派車備註新增成功"
    else
      @notes = Note.all
      render :index
    end
  end

  def update
    if @note.update(note_params)
      redirect_to admin_notes_path, notice: "派車備註更新完成"
    else
      @categories = Note.all
      render :index
    end
  end

  def destroy
    if @note.destroy
      redirect_to admin_notes_path, notice: "派車備註刪除完畢"
    else
      flash[:alert] = @note.errors.full_messages.to_sentence
      redirect_to admin_notes_path
    end
  end
  private
  def note_params
    params.require(:note).permit(:content)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end
