from django.views import generic
from .models import Article

class IndexView(generic.ListView):
  model = Article
  template_name = 'blog/index.html'
  context_object_name = 'articles'

class ArticleView(generic.DetailView):
  model = Article
  template_name = 'blog/detail.html'
  context_object_name = 'article'
