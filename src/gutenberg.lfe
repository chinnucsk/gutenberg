(defmodule gutenberg
  (import
   (from riak_object (get_value 1))
   (from re (split 2))
   (from string (to_lower 1))
   (from lists (unmerge 1) (foldl 3) (sort 2))
   (rename dict
           ((to_list 1) dlist)
           ((new 0) dnew)
           ((update_counter 3) dupdate)))
  (export (map_word_count 3)
          (reduce_word_count 2)))

;; internal funs

(defun text_from_obj
  [obj]
  (binary_to_list (get_value obj)))

(defun words_from_text
  [text]
  (lc [(<- word (lc [(<- bin (split text '"[^\\w]+"))]
                  (to_lower (binary_to_list bin))))
       (> (length word) 1)]
    (list_to_binary word)))

(defun word_tuples
  [words]
  (lc [(<- word words)]
    (tuple word 1)))

(defun update_count
  ([(tuple word count) dict]
   (dupdate word count dict)))

(defun compare_count
  ([(tuple _ count0) (tuple _ count1)]
   (>= count0 count1)))

(defun reduce_words
  [words]
  (dlist (foldl (fun update_count 2) (dnew) words)))

(defun sort_words
  [words]
  (sort (fun compare_count 2) words))

;; exported funs

(defun map_word_count
  [obj _ _]
  (word_tuples (words_from_text (text_from_obj obj))))

(defun reduce_word_count
  [words _]
  (sort_words (reduce_words words)))
