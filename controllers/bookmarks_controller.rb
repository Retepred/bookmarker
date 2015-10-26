get '/bookmarks' do
#Load categories from the database
#To get data we always use a model (MVC).

@bookmarks = Bookmark.all
#Now we have the data we are passing it to a view to interact with a user. If we have a layout, it passes to it.

erb :'bookmarks/index'
end

get '/bookmarks/new' do
  @bookmark = Bookmark.new
  erb :'bookmarks/new'
end

get '/bookmarks/:id/edit' do

  @bookmark = Bookmark.find(params[:id])
  @bookmark.save

  erb :'bookmarks/edit'
end

post '/bookmarks/:id' do
  @bookmark = Bookmark.find(params[:id])
  @bookmark.update_attributes(params[:bookmark])

  redirect to("/bookmarks")
end  

post '/bookmarks' do
 @bookmark = Bookmark.new(params[:bookmark])
 @bookmark.save
 redirect to('/bookmarks')
end

post '/bookmarks/:id/delete' do
  Bookmark.find(params[:id]).destroy
  redirect to('/bookmarks')
end

get '/bookmarks/search' do

  if params[:search]
    @bookmarks = Bookmark.all(name: params[:search])
  else
    @bookmarks = Bookmark.all
  end
  erb :'bookmarks/search'

end