class ImageSerializer
  def self.format_image(data)

  	{
  	   data: {
           id: nil,
         type: 'image',
   attributes: {
          image: {
              image_url: data.image_url,
                 credit: {
                    source: data.source,
                    author: data.author,
            }
          }
        }
      }
    }
  end
end
