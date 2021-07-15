import sys

from sklearn.decomposition import TruncatedSVD
from scipy.sparse.linalg import svds

import seaborn as sns
import pandas as pd
import numpy as np

def main(argv):

    rating_data = pd.read_csv('C:/CFSVD/csv/user_activity.csv', encoding='cp949')
    movie_data = pd.read_csv('C:/CFSVD/csv/product.csv', encoding='cp949')
    
    user_movie_rating = pd.merge(rating_data, movie_data, on='PRODUCT_ID')
    
    user_movie_rating = user_movie_rating.pivot_table('PREFERENCE', index = 'MEMBER_ID', columns = 'PRODUCT_ID').fillna(0)

    #print(user_movie_rating)
    
    movie_user_rating = user_movie_rating.values.T
    
    SVD = TruncatedSVD(n_components = 3)
    
    matrix = SVD.fit_transform(movie_user_rating)
    
    corr = np.corrcoef(matrix)
    
    movie_title = user_movie_rating.columns
    movie_title_list = list(movie_title)
    #coffey_hands = movie_title_list.index(argv[1])
    coffey_hands = movie_title_list.index('MN2B3KSC043W')
    
    corr_coffey_hands = corr[coffey_hands]

    print(list(movie_title[((corr_coffey_hands >= 0.9) & (corr_coffey_hands != 1.0))])[:60])
    
if __name__ == "__main__":
    main(sys.argv)
