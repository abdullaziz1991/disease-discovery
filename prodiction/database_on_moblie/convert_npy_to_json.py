# import numpy as np
# import json

# labels = np.load('labels.npy')
# with open('labels.json', 'w') as f:
#     json.dump(labels.tolist(), f)

import numpy as np
import json

# تحميل labels.npy
labels = np.load('labels.npy', allow_pickle=True)


# تحويل إلى قائمة Python عادية (إذا كانت من نوع numpy.ndarray)
labels_list = labels.tolist()

# حفظها في ملف JSON
with open('labels.json', 'w', encoding='utf-8') as f:
    json.dump(labels_list, f, ensure_ascii=False)
